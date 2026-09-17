"""
clevo_backlight_gui.py — Clevo N9xTP6 keyboard backlight control (tkinter GUI).

Wraps clevo_ec.ClevoKeyboardEC (direct EC mailbox writes via WinRing0).
Run as Administrator (or via Clevo-Backlight-GUI.bat which self-elevates).

Features:
  * power / brightness / per-zone color picker / effect modes / speed
  * palette presets (click to apply to all zones)
  * settings auto-saved to settings.json on every change
  * saved state re-applied at launch
  * re-apply after resume from sleep (Visibility hook)
  * global hotkey editor (Ctrl+Alt+L / brightness / cycle color)
  * music-reactive mode (WASAPI loopback -> bass/mid/treble zones)
"""
import os
import sys, io
if sys.stdout is not None:      # pythonw has no stdout
    try:
        sys.stdout.flush()
        _buf = sys.stdout.detach()   # old wrapper must not own/close the buffer
        sys.stdout = io.TextIOWrapper(_buf, encoding="utf-8",
                                      errors="replace", line_buffering=True)
    except Exception:
        pass

import time
import threading
import tkinter as tk
from tkinter import messagebox, colorchooser, simpledialog, ttk

import config
import clevo_music
import clevo_ambient
import clevo_temp
import clevo_fan
from clevo_ec import ClevoKeyboardEC

APP_TITLE = "Clevo N957TP6 Keyboard Backlight"
LABEL_FONT = ("Segoe UI", 9)

MODES = [
    ("Custom",  None),
    ("Random",  "random"),
    ("Dance",   "dance"),
    ("Tempo",   "tempo"),
    ("Flash",   "flash"),
    ("Wave",    "wave"),
    ("Breathe", "breathe"),
    ("Cycle",   "cycle"),
]
LABEL_TO_MODE = {label: mode for label, mode in MODES}
ZONE_NAMES = ["Left", "Middle", "Right"]
HOTKEY_LABELS = {
    "toggle": "สลับเปิด/ปิดไฟ",
    "brightness_down": "หรี่ลง 1 ระดับ",
    "brightness_up": "เพิ่ม 1 ระดับ",
    "cycle_color": "เปลี่ยนสีถัดไป",
    "cycle_profile": "สลับโปรไฟล์ถัดไป",
    "music": "โหมดเพลง เปิด/ปิด (daemon)",
    "ambient": "โหมด Ambient เปิด/ปิด (daemon)",
}
RESUME_GAP = 60.0          # seconds: hidden longer than this = probably sleep
RESUME_DELAY_MS = 1500     # wait for the EC to be ready after wake


class App:
    def __init__(self, root):
        self.root = root
        root.title(APP_TITLE)
        root.resizable(False, False)
        self._max_body_h = max(320, root.winfo_screenheight() - 150)

        self.kb = None
        self.settings = config.Settings()
        snap = self.settings.snapshot()
        self.zone_colors = config.Settings.colors_rgb(self.settings)
        self.mode_var = tk.StringVar(value=snap["mode"].capitalize())
        self.brightness = tk.IntVar(value=snap["brightness"])
        self.speed = tk.IntVar(value=snap["speed"])
        self._last_seen = time.time()
        self.music_rend = None
        self.ambient = None
        self.temp_rend = None
        self.fan = None              # FanController (read-only monitor)
        self.fan_watch_thread = None
        self.fan_watch_stop = None

        self._build_ui()
        self._bind_resume_hook()
        self._init_hardware()

    # ---------- UI construction ----------
    def _build_ui(self):
        pad = dict(padx=8, pady=6)

        # Scrollable host: every panel packs into this frame (inside a
        # canvas) instead of the root, so the window can never overflow
        # the bottom of the screen — it scrolls instead.
        outer = tk.Frame(self.root)
        outer.pack(fill="both", expand=True)
        self._canvas = tk.Canvas(outer, highlightthickness=0, bg="#f0f0f0")
        self._vsb = tk.Scrollbar(outer, orient="vertical",
                                 command=self._canvas.yview)
        self._canvas.configure(yscrollcommand=self._update_vsb)
        self._vsb_shown = True
        self._vsb.pack(side="right", fill="y")
        self._canvas.pack(side="left", fill="both", expand=True)
        host = tk.Frame(self._canvas)
        self._host = host
        self._body_id = self._canvas.create_window((0, 0), window=host,
                                                   anchor="nw")
        host.bind("<Configure>",
                  lambda e: self._canvas.configure(
                      scrollregion=self._canvas.bbox("all")))
        self._canvas.bind("<Configure>",
                          lambda e: self._canvas.itemconfigure(
                              self._body_id, width=e.width))
        self._canvas.bind_all("<MouseWheel>", self._on_mousewheel)

        top = tk.Frame(host)
        top.pack(fill="x", **pad)
        tk.Button(top, text="Power ON",  width=12, command=lambda: self._power(True)).pack(side="left", padx=4)
        tk.Button(top, text="Power OFF", width=12, command=lambda: self._power(False)).pack(side="left", padx=4)
        tk.Button(top, text="บันทึกเป็นค่าเริ่มต้น", width=18,
                  command=self._save_defaults).pack(side="left", padx=12)

        bf = tk.LabelFrame(host, text="Brightness (4 steps)", fg="#444")
        bf.pack(fill="x", **pad)
        for lvl in range(4):
            tk.Radiobutton(bf, text=str(lvl), value=lvl, variable=self.brightness,
                           command=self._apply_brightness).pack(side="left", padx=6)

        sf = tk.LabelFrame(host, text="Effect speed (custom modes only)", fg="#444")
        sf.pack(fill="x", **pad)
        tk.Scale(sf, from_=0, to=9, orient="horizontal", variable=self.speed,
                 command=lambda _v: self._apply_speed(), length=260).pack(padx=8)

        zf = tk.LabelFrame(host, text="Zone colors (click a swatch to pick)", fg="#444")
        zf.pack(fill="x", **pad)
        row = tk.Frame(zf)
        row.pack()
        self.zone_swatches = []
        for z in range(3):
            tk.Label(row, text=ZONE_NAMES[z], font=LABEL_FONT, width=8).grid(row=0, column=z)
            sw = tk.Label(row, width=14, height=2, relief="groove", bg="#777777", cursor="hand2")
            sw.grid(row=1, column=z, padx=6)
            sw.bind("<Button-1>", lambda e, z=z: self._pick_color(z))
            self.zone_swatches.append(sw)

        pf = tk.LabelFrame(host, text="Palette presets (apply to all zones)", fg="#444")
        pf.pack(fill="x", **pad)
        prow = tk.Frame(pf)
        prow.pack()
        self.palette_buttons = []
        for i, hexcol in enumerate(self.settings.get("palette")):
            b = tk.Label(prow, width=3, height=1, relief="groove",
                         bg="#" + hexcol, cursor="hand2")
            b.grid(row=0, column=i, padx=2)
            b.bind("<Button-1>", lambda e, c=hexcol: self._apply_preset(c))
            self.palette_buttons.append(b)

        mf = tk.LabelFrame(host, text="Effect mode", fg="#444")
        mf.pack(fill="x", **pad)
        mrow = tk.Frame(mf)
        mrow.pack()
        for label, _mode in MODES:
            tk.Radiobutton(mrow, text=label, value=label, variable=self.mode_var,
                           command=self._apply_mode).pack(side="left", padx=4)

        muf = tk.LabelFrame(host, text="Music reactive (system audio)", fg="#444")
        muf.pack(fill="x", **pad)
        murow = tk.Frame(muf)
        murow.pack(fill="x")
        self.music_btn = tk.Button(murow, text="▶ เริ่มตามเสียงเพลง", width=16,
                                   command=self._music_toggle)
        self.music_btn.pack(side="left", padx=4)
        self.music_gradient = tk.BooleanVar(value=False)
        tk.Checkbutton(murow, text="สีไล่เฉดเดียว",
                       variable=self.music_gradient).pack(side="left", padx=4)
        self.music_gradient_color = "FF0080"
        self.grad_swatch = tk.Label(murow, width=3, height=1, relief="groove",
                                    bg="#" + self.music_gradient_color, cursor="hand2")
        self.grad_swatch.pack(side="left", padx=2)
        self.grad_swatch.bind("<Button-1>", lambda e: self._music_pick_gradient())
        tk.Label(murow, text="Sensitivity", font=LABEL_FONT).pack(side="left", padx=(12, 2))
        self.music_sens = tk.DoubleVar(value=1.0)
        tk.Scale(murow, from_=0.2, to=3.0, resolution=0.1, orient="horizontal",
                 variable=self.music_sens, length=130, showvalue=True,
                 command=lambda _v: self._music_live_sensitivity()).pack(side="left")
        self.music_canvas = tk.Canvas(muf, width=300, height=54, bg="#111111",
                                      highlightthickness=0)
        self.music_canvas.pack(padx=8, pady=(0, 6))
        self._bars = []
        for i, lab in enumerate(("BASS", "MID", "TRE")):
            y = 6 + i * 16
            self.music_canvas.create_text(30, y + 6, text=lab, fill="#888888",
                                          font=("Consolas", 8), anchor="w")
            self._bars.append(self.music_canvas.create_rectangle(
                64, y, 66, y + 12, fill="#333333", width=0))

        af = tk.LabelFrame(host, text="Ambient (screen colors)", fg="#444")
        af.pack(fill="x", **pad)
        arow = tk.Frame(af)
        arow.pack(fill="x")
        self.ambient_btn = tk.Button(arow, text="▶ เริ่มตามสีหน้าจอ", width=16,
                                     command=self._ambient_toggle)
        self.ambient_btn.pack(side="left", padx=4)
        self.ambient_mix = tk.DoubleVar(value=0.35)
        tk.Label(arow, text="Mix (0=สีที่เซฟ, 1=สีจอล้วน)", font=LABEL_FONT).pack(side="left", padx=(12, 2))
        tk.Scale(arow, from_=0.0, to=1.0, resolution=0.05, orient="horizontal",
                 variable=self.ambient_mix, length=150, showvalue=True,
                 command=lambda _v: self._ambient_live_mix()).pack(side="left")

        prf = tk.LabelFrame(host, text="Color profiles", fg="#444")
        prf.pack(fill="x", **pad)
        self._profile_row = tk.Frame(prf)
        self._profile_row.pack(fill="x")
        self._rebuild_profile_buttons()

        self._build_automation_ui()

        hf = tk.LabelFrame(host, text="Global hotkeys", fg="#444")
        hf.pack(fill="x", **pad)
        hrow = tk.Frame(hf)
        hrow.pack()
        tk.Button(hrow, text="ตั้งค่า hotkeys…", width=16,
                  command=self._open_hotkey_editor).pack(side="left", padx=4)
        self.hotkey_summary = tk.Label(hrow, text="", font=LABEL_FONT, fg="#666")
        self.hotkey_summary.pack(side="left", padx=8)
        self._update_hotkey_summary()

        stf = tk.LabelFrame(host, text="Status", fg="#444")
        stf.pack(fill="x", **pad)
        self.status = tk.Label(stf, text="init…", font=("Consolas", 9), anchor="w")
        self.status.pack(fill="x", padx=6)

        helpf = tk.Frame(host)
        helpf.pack(fill="x", **pad)
        tk.Button(helpf, text="About / protocol notes", width=24,
                  command=self._show_about).pack(side="left", padx=4)

        self._fit_window()

    def _update_vsb(self, first, last):
        """Scrollbar proxy: also auto-hides the bar when everything fits."""
        self._vsb.set(first, last)
        needed = not (float(first) <= 0.0 and float(last) >= 1.0)
        if needed and not self._vsb_shown:
            self._vsb.pack(side="right", fill="y")
            self._vsb_shown = True
        elif not needed and self._vsb_shown:
            self._vsb.pack_forget()
            self._vsb_shown = False

    def _fit_window(self):
        """Shrink-wrap the window; cap the height to the screen and let
        the inner canvas scroll for the rest. Also clamps the final
        position so the window can never hang below the work area."""
        self._canvas.update_idletasks()
        need = self._host.winfo_reqheight()
        width = max(560, self._host.winfo_reqwidth())
        self._canvas.configure(width=width, height=min(need, self._max_body_h))
        self._canvas.update_idletasks()
        self.root.geometry("")
        self.root.update_idletasks()
        # clamp: keep the whole window on screen (taskbar-safe margin)
        bottom_limit = self.root.winfo_screenheight() - 44
        h = self.root.winfo_height()
        y = self.root.winfo_rooty()
        if y + h > bottom_limit:
            self.root.geometry("+%d+%d" % (self.root.winfo_rootx(),
                                           max(0, bottom_limit - h)))

    def _on_mousewheel(self, event):
        try:
            self._canvas.yview_scroll(int(-event.delta / 120), "units")
        except Exception:
            pass

    def _bind_resume_hook(self):
        def on_visible(_event=None):
            now = time.time()
            gap = now - self._last_seen
            self._last_seen = now
            if gap > RESUME_GAP and self.kb and self.settings.get("power"):
                self.status.config(text="กลับจาก sleep… จะคืนค่าไฟใน 1.5 วิ")
                self.root.after(RESUME_DELAY_MS, self._reapply_saved)
        self.root.bind("<Visibility>", on_visible)
        self.root.bind("<Map>", on_visible)

    # ---------- hardware init ----------
    def _init_hardware(self):
        try:
            self.kb = ClevoKeyboardEC()
        except Exception as e:
            messagebox.showerror(APP_TITLE,
                "Cannot access the EC.\n\nRun as Administrator.\n\nDetails:\n" + str(e))
            self._set_status("EC access failed (need admin)")
            return
        self._set_status("EC ready (WinRing0 loaded; EC access OK)")
        # repaint swatches from saved settings and push the saved state
        for z, (r, g, b) in enumerate(self.zone_colors):
            self.zone_swatches[z].configure(bg="#%02x%02x%02x" % (r, g, b))
        self.root.after(300, lambda: self._apply_saved(on_launch=True))

    def _set_status(self, text):
        """Update the status line (safe even before the label exists)."""
        try:
            self.status.config(text=text)
        except Exception:
            pass

    # ---------- apply helpers ----------
    def _push_settings(self, save=True):
        colors = ["%02X%02X%02X" % c for c in self.zone_colors]
        self.settings.set("colors", colors, save=save)
        self.settings.set("brightness", self.brightness.get(), save=save)
        self.settings.set("mode", self.mode_var.get().lower(), save=save)
        self.settings.set("speed", self.speed.get(), save=save)

    def _apply_saved(self, on_launch=False):
        if not self.kb:
            return
        try:
            snap = self.settings.snapshot()
            snap["power"] = True
            config.apply_state(self.kb, snap)
            self._set_status("คืนค่าที่บันทึกไว้เรียบร้อย" if on_launch
                             else "คืนค่าไฟหลัง sleep เรียบร้อย")
        except Exception as e:
            self._set_status("re-apply: %s" % e)

    def _reapply_saved(self):
        self._apply_saved(on_launch=False)

    def _save_defaults(self):
        self._push_settings(save=True)
        self.settings.set("power", True)
        self._set_status("บันทึก settings.json แล้ว (จะถูกใช้ตอนเปิดเครื่อง/daemon)")

    # ---------- actions ----------
    def _power(self, on):
        if not self.kb:
            return
        self._ensure_music_stopped()
        try:
            self.kb.power_on(on)
            self.settings.set("power", on)
            if on:
                self._push_settings(save=False)
                snap = self.settings.snapshot()
                config.apply_state(self.kb, snap)
            self._set_status("backlight ON" if on else "backlight OFF")
        except Exception as e:
            self._set_status("power: %s" % e)

    def _apply_brightness(self):
        if not self.kb:
            return
        self._ensure_music_stopped()
        try:
            self.kb.set_brightness(self.brightness.get())
            self._push_settings()
            self._set_status("brightness -> %d" % self.brightness.get())
        except Exception as e:
            self._set_status("brightness: %s" % e)

    def _apply_speed(self):
        if not self.kb:
            return
        mode = self.mode_var.get().lower()
        if mode == "custom":
            return
        try:
            self.kb.set_speed(self.speed.get())
            self._push_settings()
            self._set_status("speed -> %d" % self.speed.get())
        except Exception as e:
            self._set_status("speed: %s" % e)

    def _apply_mode(self):
        if not self.kb:
            return
        self._ensure_music_stopped()
        label = self.mode_var.get()
        mode = LABEL_TO_MODE.get(label)
        try:
            if mode is None:
                for z, (r, g, b) in enumerate(self.zone_colors):
                    self.kb.set_zone_color(z, r, g, b)
            else:
                self.kb.set_mode(mode)
                self.kb.set_speed(self.speed.get())
            self._push_settings()
            self._set_status("mode -> %s" % label.lower())
        except Exception as e:
            self._set_status("mode: %s" % e)

    def _apply_preset(self, hexcol):
        r, g, b = (int(hexcol[0:2], 16), int(hexcol[2:4], 16), int(hexcol[4:6], 16))
        if not self.kb:
            return
        self._ensure_music_stopped()
        try:
            self.kb.power_on(True)
            for z in range(3):
                self.kb.set_zone_color(z, r, g, b)
            for z in range(3):
                self.zone_colors[z] = (r, g, b)
                self.zone_swatches[z].configure(bg="#" + hexcol)
            self.mode_var.set("Custom")
            self._push_settings()
            self._set_status("preset %s ทั้งแถบ ok" % hexcol)
        except Exception as e:
            self._set_status("preset: %s" % e)

    def _pick_color(self, z):
        r, g, b = self.zone_colors[z]
        self.root.attributes("-topmost", True)
        try:
            rgb, _hex = colorchooser.askcolor(color=(r, g, b), parent=self.root,
                                              title="Zone %d color" % z)
        finally:
            self.root.attributes("-topmost", False)
        if rgb:
            self._set_zone_color(z, tuple(int(c) for c in rgb))

    def _set_zone_color(self, z, rgb):
        self._ensure_music_stopped()
        r, g, b = rgb
        self.zone_colors[z] = (r, g, b)
        hexcol = "#%02x%02x%02x" % (r, g, b)
        self.zone_swatches[z].configure(bg=hexcol)
        if self.kb:
            try:
                self.kb.power_on(True)
                self.kb.set_zone_color(z, r, g, b)
                self.mode_var.set("Custom")
                self._push_settings()
                self._set_status("zone %d -> %s  ok" % (z, hexcol.upper()))
            except Exception as e:
                self._set_status("zone %d: %s" % (z, e))

    # ---------- music mode ----------
    def _ensure_music_stopped(self):
        stopped = False
        if self.music_rend is not None:
            self._music_stop()
            stopped = True
        if self.ambient is not None:
            self._ambient_stop()
            stopped = True
        if self.temp_rend is not None:
            self._temp_stop()
            stopped = True
        if stopped:
            self._set_status("โหมดเรียลไทม์ (เพลง/ambient/อุณหภูมิ) หยุดแล้ว")

    # ---------- temperature mode ----------
    def _temp_toggle(self):
        if self.temp_rend is not None:
            self._temp_stop()
            self._set_status("temperature mode stopped")
            return
        if not self.kb:
            messagebox.showerror(APP_TITLE, "EC not available (run as Administrator).")
            return
        self._ensure_music_stopped()
        try:
            self.kb.power_on(True)
        except Exception:
            pass
        self.temp_rend = clevo_temp.TempRenderer(
            self.kb, source=self.temp_source.get(),
            reg=self.settings.get("engines", {}).get("temp_reg"))
        self.temp_rend.start()
        self.temp_btn.config(text="■ หยุดโหมดอุณหภูมิ")
        self._set_status("temperature mode: อ่านความร้อนจาก EC ทุก 2 วิ (ปิด = กดปุ่มเดิม)")
        self._poll_temp()

    def _temp_stop(self):
        if self.temp_rend is None:
            return
        rend = self.temp_rend
        self.temp_rend = None
        try:
            rend.stop()
        except Exception:
            pass
        self.temp_btn.config(text="▶ เริ่มตามอุณหภูมิ")
        self.temp_label.config(text="")

    def _poll_temp(self):
        if self.temp_rend is None:
            return
        if not self.temp_rend.is_alive():
            self._temp_stop()
            self._set_status("temperature mode ended")
            return
        t = self.temp_rend.last_temp
        if t is not None:
            self.temp_label.config(text="%d°C" % t)
        self.root.after(1500, self._poll_temp)

    # ---------- battery saver ----------
    # ---------- fan monitor ----------
    def _fan(self):
        """Single FanController for the whole app (read-only monitor —
        manual fan duty is NOT supported by this EC firmware: the EC
        rewrites DUT itself and never feeds it to PWM, see RESEARCH.md)."""
        if self.fan is None:
            self.fan = clevo_fan.FanController(self.kb)
        return self.fan

    def _fan_refresh(self):
        if not self.kb:
            self._set_status("EC not available (run as Administrator)")
            return
        try:
            st = self._fan().status()
            self.fan_label.config(
                text="CPU: %d rpm (%d%%) · GPU: %d rpm (%d%%)"
                     % (st["cpu"]["rpm"], st["cpu"]["duty_pct"],
                        st["gpu"]["rpm"], st["gpu"]["duty_pct"]))
            self._set_status("อ่านสถานะพัดลมแล้ว (โหมดอ่านอย่างเดียว)")
        except Exception as e:
            self._set_status("fan status: %s" % e)

    def _fan_toggle_watch(self):
        """Start/stop the 1 Hz live monitor (worker thread only READS the
        EC into a plain attribute; the label is updated from a main-thread
        poller — Tkinter calls must stay on the Tk thread)."""
        if not self.kb:
            return
        if self.fan_watch_stop is not None:
            self.fan_watch_stop.set()
            self.fan_watch_stop = None
            if self.fan_watch_thread is not None:
                self.fan_watch_thread.join(timeout=2)
                self.fan_watch_thread = None
            self.fan_watch_btn.config(text="▶ เริ่มมอนิเตอร์")
            self._set_status("หยุดมอนิเตอร์พัดลมแล้ว")
            return
        stop = threading.Event()
        self.fan_watch_stop = stop
        self._fan_watch_line = None

        def loop():
            fc = self._fan()
            while not stop.is_set():
                try:
                    st = fc.status()
                    self._fan_watch_line = (
                        "CPU: %d rpm (%d%%) · GPU: %d rpm (%d%%)"
                        % (st["cpu"]["rpm"], st["cpu"]["duty_pct"],
                           st["gpu"]["rpm"], st["gpu"]["duty_pct"]))
                except Exception as e:
                    self._fan_watch_line = "อ่าน EC ไม่สำเร็จ: %s" % e
                stop.wait(1.0)

        self.fan_watch_thread = threading.Thread(
            target=loop, daemon=True, name="ClevoFanWatch")
        self.fan_watch_thread.start()
        self.root.after(200, self._fan_poll)
        self.fan_watch_btn.config(text="■ หยุดมอนิเตอร์")
        self._set_status("มอนิเตอร์พัดลมทำงาน — อัปเดตทุก 1 วิ (อ่านอย่างเดียว)")

    def _fan_poll(self):
        """Main-thread poller: paint the worker's latest reading."""
        if self.fan_watch_stop is None:
            return
        line = getattr(self, "_fan_watch_line", None)
        if line:
            self.fan_label.config(text=line)
        self.root.after(1000, self._fan_poll)

    # ---------- dashboard settings ----------
    def _save_dashboard(self):
        dash = self.settings.get("dashboard")
        dash["enabled"] = bool(self.dash_enabled_var.get())
        dash["bind"] = self.dash_bind_var.get()
        dash["token"] = self.dash_token_var.get().strip()
        if getattr(self, "dash_ctrl_var", None) is not None:
            dash["allow_control"] = bool(self.dash_ctrl_var.get())
        self.settings.set("dashboard", dash)
        self._set_status("บันทึก dashboard แล้ว — daemon ใช้ค่าใหม่ตอนรีสตาร์ท (Ctrl+Alt+K → tray เริ่มใหม่)")

    def _save_engine_defaults(self):
        """Persist the renderer defaults the daemon uses for hotkey toggles."""
        eng = self.settings.get("engines")
        eng["music_sensitivity"] = max(0.1, min(5.0, float(self.eng_sens_var.get())))
        eng["ambient_mix"] = max(0.0, min(1.0, float(self.eng_mix_var.get())))
        reg = self.eng_reg_var.get().strip()
        if not reg:
            eng["temp_reg"] = None
        else:
            try:
                val = int(reg, 0)
                if not 0 <= val <= 255:
                    raise ValueError
                eng["temp_reg"] = val
            except ValueError:
                self._set_status("Temp reg ต้องเป็นเลข 0-255 (เช่น 0x07) หรือเว้นว่าง")
                return
        self.settings.set("engines", eng)
        self._set_status("บันทึกค่าเริ่มต้นเอนจินแล้ว (daemon ใช้ทันที — ไม่ต้องรีสตาร์ท)")

    def _save_notifications(self):
        n = self.settings.get("notifications")
        n["enabled"] = bool(self.notif_enabled_var.get())
        n["on_ec_fail"] = bool(self.notif_ec_fail_var.get())
        n["on_ec_recover"] = bool(self.notif_ec_rec_var.get())
        n["on_fan_stall"] = bool(self.notif_fan_var.get())
        try:
            n["temp_threshold"] = max(60, min(110, int(self.notif_temp_var.get())))
        except (TypeError, ValueError):
            n["temp_threshold"] = 90
        n["discord_webhook"] = self.notif_discord_var.get().strip()
        n["telegram_token"] = self.notif_tg_token_var.get().strip()
        n["telegram_chat_id"] = self.notif_tg_chat_var.get().strip()
        self.settings.set("notifications", n)
        self._set_status("บันทึกการแจ้งเตือนแล้ว (daemon ใช้ค่าใหม่ในรอบ health ถัดไป)")

    def _save_battery(self):
        bat = self.settings.get("battery")
        bat["enabled"] = bool(self.battery_enabled_var.get())
        bat["profile"] = self.battery_profile_var.get()
        bat["brightness"] = int(self.battery_bright_var.get())
        try:
            bat["low_percent"] = max(0, min(95, int(self.battery_low_var.get())))
        except (TypeError, ValueError):
            bat["low_percent"] = 0
        self.settings.set("battery", bat)
        self._set_status("บันทึก battery saver แล้ว (daemon เช็กทุก 10 วิ)")

    def _music_toggle(self):
        if self.music_rend is not None:
            self._music_stop()
            self._set_status("music mode stopped")
            return
        if not self.kb:
            messagebox.showerror(APP_TITLE, "EC not available (run as Administrator).")
            return
        if self.music_gradient.get():
            colors = clevo_music.gradient_colors(self.music_gradient_color)
        else:
            colors = list(self.zone_colors)
        try:
            self.kb.power_on(True)
        except Exception:
            pass
        self.music_rend = clevo_music.MusicRenderer(
            self.kb, colors, sensitivity=self.music_sens.get())
        self.music_rend.start()
        self.music_btn.config(text="■ หยุดโหมดเพลง")
        self._set_status("music mode: ฟังเสียงระบบแล้ว (ปิด = กดปุ่มเดิม)")
        self._poll_music()

    def _music_stop(self):
        if self.music_rend is None:
            return
        rend = self.music_rend
        self.music_rend = None
        try:
            rend.stop()
        except Exception:
            pass
        self.music_btn.config(text="▶ เริ่มตามเสียงเพลง")

    def _music_live_sensitivity(self):
        """Adjust the gain of a running renderer without restarting it."""
        if self.music_rend is not None:
            try:
                self.music_rend.sensitivity = float(self.music_sens.get())
            except Exception:
                pass

    def _music_pick_gradient(self):
        rgb = colorchooser.askcolor(color="#" + self.music_gradient_color,
                                    parent=self.root, title="Gradient base color")
        if rgb and rgb[0]:
            r, g, b = (int(c) for c in rgb[0])
            self.music_gradient_color = "%02X%02X%02X" % (r, g, b)
            self.grad_swatch.configure(bg="#" + self.music_gradient_color)

    def _poll_music(self):
        if self.music_rend is None:
            return
        if not self.music_rend.is_alive():
            self._music_stop()
            self._set_status("music mode ended")
            return
        try:
            levels = self.music_rend.last_levels
            base = (self.music_rend.base_colors
                    if getattr(self.music_rend, "base_colors", None)
                    else self.zone_colors)
            for i, v in enumerate(levels):
                v = max(0.0, min(1.0, v))
                _x0, y0, _x1, y1 = self.music_canvas.coords(self._bars[i])
                self.music_canvas.coords(self._bars[i], 64, y0, 64 + 4 + 228 * v, y1)
                col = tuple(int(c * max(0.25, v)) for c in base[i])
                self.music_canvas.itemconfigure(
                    self._bars[i], fill="#%02x%02x%02x" % col)
        except Exception:
            pass
        self.root.after(80, self._poll_music)

    # ---------- color profiles ----------
    def _rebuild_profile_buttons(self):
        for w in self._profile_row.winfo_children():
            w.destroy()
        self.profile_buttons = {}
        for name in sorted(self.settings.get("profiles")):
            prof = self.settings.get("profiles")[name]
            mark = "●" if self.settings.get("active_profile") == name else "○"
            b = tk.Button(self._profile_row,
                          text="%s %s" % (mark, name), width=14,
                          command=lambda n=name: self._apply_profile(n))
            b.pack(side="left", padx=4)
            self.profile_buttons[name] = b
        tk.Button(self._profile_row, text="＋ บันทึกค่าปัจจุบัน", width=16,
                  command=self._profile_save_current).pack(side="left", padx=(10, 2))
        tk.Button(self._profile_row, text="ลบโปรไฟล์…", width=10,
                  command=self._profile_delete).pack(side="left", padx=2)
        tk.Label(self._profile_row,
                 text="(hotkey Ctrl+Alt+P = โปรไฟล์ถัดไป)",
                 font=LABEL_FONT, fg="#888").pack(side="left", padx=8)

    def _profile_save_current(self):
        """Snapshot the widgets' current state as a new (or overwritten) profile."""
        name = simpledialog.askstring(
            "บันทึกโปรไฟล์", "ชื่อโปรไฟล์:", parent=self.root)
        if not name or not name.strip():
            return
        name = name.strip()
        prof = {
            "brightness": int(self.brightness.get()),
            "colors": ["%02X%02X%02X" % c for c in self.zone_colors],
            "mode": self.mode_var.get().lower(),
            "speed": int(self.speed.get()),
        }
        profiles = self.settings.get("profiles")
        existed = name in profiles
        profiles[name] = prof
        self.settings.set("profiles", profiles)
        if self.settings.get("active_profile") == name:
            pass                          # already active — keep it marked
        self._rebuild_profile_buttons()
        self._set_status("%sโปรไฟล์ '%s' แล้ว" % ("อัปเดต" if existed else "บันทึก", name))

    def _profile_delete(self):
        profiles = self.settings.get("profiles")
        if not profiles:
            return
        name = simpledialog.askstring(
            "ลบโปรไฟล์", "ชื่อโปรไฟล์ที่จะลบ:", parent=self.root)
        if not name or name.strip() not in profiles:
            self._set_status("ไม่มีโปรไฟล์ชื่อ '%s'" % (name or ""))
            return
        name = name.strip()
        profiles.pop(name)
        self.settings.set("profiles", profiles)
        if self.settings.get("active_profile") == name:
            self.settings.set("active_profile", "")
        self._rebuild_profile_buttons()
        self._set_status("ลบโปรไฟล์ '%s' แล้ว" % name)

    # dialog-free variants (used by the smoke test)
    def _profile_save_current_for_test(self, name):
        prof = {
            "brightness": int(self.brightness.get()),
            "colors": ["%02X%02X%02X" % c for c in self.zone_colors],
            "mode": self.mode_var.get().lower(),
            "speed": int(self.speed.get()),
        }
        profiles = self.settings.get("profiles")
        profiles[name] = prof
        self.settings.set("profiles", profiles)
        self._rebuild_profile_buttons()

    def _profile_delete_for_test(self, name):
        profiles = self.settings.get("profiles")
        profiles.pop(name, None)
        self.settings.set("profiles", profiles)
        self._rebuild_profile_buttons()

    def _apply_profile(self, name):
        if not self.kb:
            return
        self._ensure_music_stopped()
        try:
            state = config.apply_profile(self.kb, self.settings, name)
        except Exception as e:
            self._set_status("profile %s: %s" % (name, e))
            return
        # sync widgets to the applied profile
        self.brightness.set(state["brightness"])
        self.speed.set(state["speed"])
        self.mode_var.set(state["mode"].capitalize())
        self.zone_colors = config.Settings.colors_rgb(self.settings)
        for z, (r, g, b) in enumerate(self.zone_colors):
            self.zone_swatches[z].configure(bg="#%02x%02x%02x" % (r, g, b))
        self._rebuild_profile_buttons()
        self._set_status("โปรไฟล์ '%s' ถูกใช้แล้ว (บันทึกลง settings.json)" % name)

    # ---------- ambient mode ----------
    def _ambient_toggle(self):
        if self.ambient is not None:
            self._ambient_stop()
            self._set_status("ambient mode stopped")
            return
        if not self.kb:
            messagebox.showerror(APP_TITLE, "EC not available (run as Administrator).")
            return
        if not (clevo_ambient.HAS_MSS or clevo_ambient.HAS_PIL):
            messagebox.showerror(APP_TITLE,
                                 "ไม่มี backend จับหน้าจอ — ติดตั้งด้วย: pip install mss")
            return
        self._ensure_music_stopped()
        try:
            self.kb.power_on(True)
        except Exception:
            pass
        self.ambient = clevo_ambient.AmbientRenderer(
            self.kb, mix=self.ambient_mix.get())
        self.ambient.start()
        self.ambient_btn.config(text="■ หยุดโหมด ambient")
        self._set_status("ambient mode: มองสีหน้าจอแล้ว (ปิด = กดปุ่มเดิม)")

    def _ambient_stop(self):
        if self.ambient is None:
            return
        rend = self.ambient
        self.ambient = None
        try:
            rend.stop()
        except Exception:
            pass
        self.ambient_btn.config(text="▶ เริ่มตามสีหน้าจอ")

    def _ambient_live_mix(self):
        """Adjust the screen/saved blend of a running renderer without restarting."""
        if self.ambient is not None:
            try:
                self.ambient.mix = float(self.ambient_mix.get())
            except Exception:
                pass

    # ---------- automation (game profiles + day schedule) ----------
    def _build_automation_ui(self):
        host = self._host          # panels live inside the scrollable host
        pad = dict(padx=8, pady=6)
        ap = self.settings.get("auto_profiles")
        sch = self.settings.get("schedule")

        gf = tk.LabelFrame(host, text="Automation — Game profiles (สลับโปรไฟล์เมื่อเกมได้โฟกัส)", fg="#444")
        gf.pack(fill="x", **pad)
        grow = tk.Frame(gf)
        grow.pack(fill="x")
        self.auto_enabled_var = tk.BooleanVar(value=ap.get("enabled", False))
        tk.Checkbutton(grow, text="เปิดใช้งาน (ตรวจหน้าต่างโฟกัส)",
                       variable=self.auto_enabled_var,
                       command=self._save_automation).pack(side="left", padx=4)
        tk.Label(grow, text="กลับไปโปรไฟล์เมื่อปิดเกม:", font=LABEL_FONT).pack(side="left", padx=(12, 2))
        self.auto_restore_var = tk.StringVar(value=ap.get("restore_profile", ""))
        tk.OptionMenu(grow, self.auto_restore_var, "",
                      *sorted(self.settings.get("profiles")),
                      command=lambda _e: self._save_automation()).pack(side="left")

        mrow = tk.Frame(gf)
        mrow.pack(fill="x")
        self.game_list = tk.Listbox(mrow, height=3, width=44)
        self.game_list.pack(side="left", padx=4)
        self._refresh_game_list()
        lbtns = tk.Frame(mrow)
        lbtns.pack(side="left", padx=4)
        tk.Label(lbtns, text="game.exe:", font=LABEL_FONT).grid(row=0, column=0, sticky="w")
        self.game_exe_var = tk.StringVar()
        tk.Entry(lbtns, textvariable=self.game_exe_var, width=18).grid(row=0, column=1, padx=2)
        tk.Label(lbtns, text="โปรไฟล์:", font=LABEL_FONT).grid(row=1, column=0, sticky="w")
        self.game_prof_var = tk.StringVar()
        tk.OptionMenu(lbtns, self.game_prof_var, *(sorted(self.settings.get("profiles")) or [""])).grid(row=1, column=1, padx=2)
        tk.Button(lbtns, text="เพิ่ม", width=8, command=self._game_add).grid(row=2, column=0, pady=2, sticky="w")
        tk.Button(lbtns, text="ลบที่เลือก", width=10, command=self._game_remove).grid(row=2, column=1, pady=2, sticky="w")

        tf = tk.LabelFrame(host, text="Temperature reactive (สีตามความร้อน CPU/GPU จาก EC)", fg="#444")
        tf.pack(fill="x", **pad)
        trow = tk.Frame(tf)
        trow.pack(fill="x")
        self.temp_btn = tk.Button(trow, text="▶ เริ่มตามอุณหภูมิ", width=16,
                                  command=self._temp_toggle)
        self.temp_btn.pack(side="left", padx=4)
        tk.Label(trow, text="แหล่ง:", font=LABEL_FONT).pack(side="left", padx=(12, 2))
        self.temp_source = tk.StringVar(value="cpu")
        tk.OptionMenu(trow, self.temp_source, "cpu", "gpu").pack(side="left")
        self.temp_label = tk.Label(trow, text="", font=LABEL_FONT, fg="#666")
        self.temp_label.pack(side="left", padx=8)

        fm = tk.LabelFrame(host, text="Fan monitor (อ่าน RPM/duty จาก EC — รุ่นนี้ EC คุมพัดลมเอง สั่ง manual ไม่ได้)", fg="#444")
        fm.pack(fill="x", **pad)
        frow = tk.Frame(fm)
        frow.pack(fill="x")
        tk.Button(frow, text="อ่านสถานะพัดลม", width=14,
                  command=self._fan_refresh).pack(side="left", padx=4)
        self.fan_watch_btn = tk.Button(frow, text="▶ เริ่มมอนิเตอร์", width=14,
                                       command=self._fan_toggle_watch)
        self.fan_watch_btn.pack(side="left", padx=(10, 4))
        tk.Label(frow, text="(อัปเดตทุก 1 วิ)", font=LABEL_FONT,
                 fg="#888").pack(side="left")
        self.fan_label = tk.Label(fm, text="", font=LABEL_FONT, fg="#666")
        self.fan_label.pack(fill="x", padx=6)

        df = tk.LabelFrame(host, text="Dashboard (หน้าเว็บสถานะสดจาก daemon)", fg="#444")
        df.pack(fill="x", **pad)
        drow = tk.Frame(df)
        drow.pack(fill="x")
        dash = self.settings.get("dashboard")
        self.dash_enabled_var = tk.BooleanVar(value=dash.get("enabled", True))
        tk.Checkbutton(drow, text="เปิดเซิร์ฟเวอร์ (port 8787)",
                       variable=self.dash_enabled_var,
                       command=self._save_dashboard).pack(side="left", padx=4)
        tk.Label(drow, text="เปิดบน LAN:", font=LABEL_FONT).pack(side="left", padx=(12, 2))
        self.dash_bind_var = tk.StringVar(value=dash.get("bind", "loopback"))
        tk.OptionMenu(drow, self.dash_bind_var, "loopback", "lan",
                      command=lambda _e: self._save_dashboard()).pack(side="left")
        tk.Label(drow, text="Token:", font=LABEL_FONT).pack(side="left", padx=(12, 2))
        self.dash_token_var = tk.StringVar(value=dash.get("token", ""))
        tk.Entry(drow, textvariable=self.dash_token_var, width=14,
                 show="*").pack(side="left")
        tk.Button(drow, text="บันทึก", width=8,
                  command=self._save_dashboard).pack(side="left", padx=4)
        tk.Label(df, text="LAN ต้องมี token (ไม่งั้น daemon จะ fallback เป็น loopback ให้เอง) — เปิดผ่าน tray ได้เสมอ",
                 font=LABEL_FONT, fg="#888").pack(fill="x", padx=6)
        self.dash_ctrl_var = tk.BooleanVar(value=dash.get("allow_control", False))
        tk.Checkbutton(df, text="อนุญาตให้ควบคุมไฟจากหน้าเว็บ/มือถือ (ปุ่ม power/brightness/profile — POST /api/cmd)",
                       variable=self.dash_ctrl_var,
                       command=self._save_dashboard).pack(fill="x", padx=6)

        nf = tk.LabelFrame(host, text="Notifications (toast จาก daemon — ทุกอันปิด/เปิดได้)", fg="#444")
        nf.pack(fill="x", **pad)
        notif = self.settings.get("notifications")
        nrow = tk.Frame(nf)
        nrow.pack(fill="x")
        self.notif_enabled_var = tk.BooleanVar(value=notif.get("enabled", True))
        tk.Checkbutton(nrow, text="เปิดแจ้งเตือน", variable=self.notif_enabled_var,
                       command=self._save_notifications).pack(side="left", padx=4)
        self.notif_ec_fail_var = tk.BooleanVar(value=notif.get("on_ec_fail", True))
        tk.Checkbutton(nrow, text="EC ล่ม", variable=self.notif_ec_fail_var,
                       command=self._save_notifications).pack(side="left", padx=4)
        self.notif_ec_rec_var = tk.BooleanVar(value=notif.get("on_ec_recover", True))
        tk.Checkbutton(nrow, text="EC กลับมา", variable=self.notif_ec_rec_var,
                       command=self._save_notifications).pack(side="left", padx=4)
        self.notif_fan_var = tk.BooleanVar(value=notif.get("on_fan_stall", True))
        tk.Checkbutton(nrow, text="พัดลมหยุดหมุน", variable=self.notif_fan_var,
                       command=self._save_notifications).pack(side="left", padx=4)
        trow = tk.Frame(nf)
        trow.pack(fill="x")
        tk.Label(trow, text="เตือนเมื่อ CPU ร้อนเกิน (°C):", font=LABEL_FONT).pack(side="left", padx=4)
        self.notif_temp_var = tk.IntVar(value=notif.get("temp_threshold", 90))
        tk.OptionMenu(trow, self.notif_temp_var, 75, 80, 85, 90, 95, 100,
                      command=lambda _e: self._save_notifications()).pack(side="left")
        tk.Label(trow, text="(ใช้เป็นเกณฑ์ของการเตือนพัดลมด้วย: RPM=0 ขณะ ≥ เกณฑ์−10°)",
                 font=LABEL_FONT, fg="#888").pack(side="left", padx=8)
        drow2 = tk.Frame(nf)
        drow2.pack(fill="x")
        tk.Label(drow2, text="Discord webhook (แจ้งเตือน+สรุปรายวัน):",
                 font=LABEL_FONT).pack(side="left", padx=4)
        self.notif_discord_var = tk.StringVar(value=notif.get("discord_webhook", ""))
        tk.Entry(drow2, textvariable=self.notif_discord_var, width=44).pack(side="left")
        tk.Button(drow2, text="บันทึก", width=8,
                  command=self._save_notifications).pack(side="left", padx=4)
        tk.Label(nf, text="วาง URL webhook จาก Discord (Server Settings → Integrations → Webhooks) — ว่าง = ปิด",
                 font=LABEL_FONT, fg="#888").pack(fill="x", padx=6)
        drow3 = tk.Frame(nf)
        drow3.pack(fill="x")
        tk.Label(drow3, text="Telegram token:", font=LABEL_FONT).pack(side="left", padx=4)
        self.notif_tg_token_var = tk.StringVar(value=notif.get("telegram_token", ""))
        tk.Entry(drow3, textvariable=self.notif_tg_token_var, width=30,
                 show="*").pack(side="left")
        tk.Label(drow3, text="chat_id:", font=LABEL_FONT).pack(side="left", padx=(10, 2))
        self.notif_tg_chat_var = tk.StringVar(value=notif.get("telegram_chat_id", ""))
        tk.Entry(drow3, textvariable=self.notif_tg_chat_var, width=12).pack(side="left")
        tk.Button(drow3, text="บันทึก", width=8,
                  command=self._save_notifications).pack(side="left", padx=4)
        tk.Label(nf, text="Telegram: สร้างบอทจาก @BotFather แล้วใส่ token + chat_id (เช่นจาก @userinfobot) — ว่าง = ปิด",
                 font=LABEL_FONT, fg="#888").pack(fill="x", padx=6)

        ef = tk.LabelFrame(host, text="Engine defaults (ค่าที่ daemon ใช้เมื่อสั่งผ่าน hotkey)", fg="#444")
        ef.pack(fill="x", **pad)
        erow = tk.Frame(ef)
        erow.pack(fill="x")
        eng0 = self.settings.get("engines")
        self.eng_sens_var = tk.DoubleVar(value=float(eng0.get("music_sensitivity", 1.0)))
        tk.Label(erow, text="Music sensitivity:", font=LABEL_FONT).pack(side="left", padx=(4, 2))
        tk.Scale(erow, from_=0.2, to=3.0, resolution=0.1, orient="horizontal",
                 variable=self.eng_sens_var, length=120, showvalue=True).pack(side="left")
        self.eng_mix_var = tk.DoubleVar(value=float(eng0.get("ambient_mix", 0.35)))
        tk.Label(erow, text="Ambient mix:", font=LABEL_FONT).pack(side="left", padx=(12, 2))
        tk.Scale(erow, from_=0.0, to=1.0, resolution=0.05, orient="horizontal",
                 variable=self.eng_mix_var, length=120, showvalue=True).pack(side="left")
        tk.Label(erow, text="Temp reg (0-255, ว่าง = ค่าเริ่มต้น):", font=LABEL_FONT).pack(side="left", padx=(12, 2))
        self.eng_reg_var = tk.StringVar(
            value="" if eng0.get("temp_reg") is None else hex(eng0.get("temp_reg")))
        tk.Entry(erow, textvariable=self.eng_reg_var, width=6).pack(side="left")
        tk.Button(erow, text="บันทึกค่าเริ่มต้นเอนจิน", width=18,
                  command=self._save_engine_defaults).pack(side="left", padx=(12, 4))

        bf = tk.LabelFrame(host, text="Battery saver (ประหยัดแบตเมื่อถอดปลั๊ก — daemon จัดการ)", fg="#444")
        bf.pack(fill="x", **pad)
        brow = tk.Frame(bf)
        brow.pack(fill="x")
        bat = self.settings.get("battery")
        self.battery_enabled_var = tk.BooleanVar(value=bat.get("enabled", False))
        tk.Checkbutton(brow, text="เปิดใช้งาน", variable=self.battery_enabled_var,
                       command=self._save_battery).pack(side="left", padx=4)
        tk.Label(brow, text="โปรไฟล์บนแบต (ว่าง = ลดแค่ความสว่าง):", font=LABEL_FONT).pack(side="left", padx=(12, 2))
        self.battery_profile_var = tk.StringVar(value=bat.get("profile", ""))
        tk.OptionMenu(brow, self.battery_profile_var, "", *sorted(self.settings.get("profiles")),
                      command=lambda _e: self._save_battery()).pack(side="left")
        tk.Label(brow, text="ความสว่างสูงสุด:", font=LABEL_FONT).pack(side="left", padx=(12, 2))
        self.battery_bright_var = tk.IntVar(value=bat.get("brightness") if bat.get("brightness") is not None else 1)
        tk.OptionMenu(brow, self.battery_bright_var, 0, 1, 2, 3,
                      command=lambda _e: self._save_battery()).pack(side="left")
        tk.Label(brow, text="หรี่เพิ่มเมื่อแบตต่ำกว่า (%):").pack(side="left", padx=(12, 2))
        self.battery_low_var = tk.IntVar(value=bat.get("low_percent", 0))
        tk.OptionMenu(brow, self.battery_low_var, 0, 15, 20, 25, 30, 40,
                      command=lambda _e: self._save_battery()).pack(side="left")
        tk.Label(brow, text="(0 = ปิด · ต่ำกว่าครึ่งของค่านี้จะหรี่เหลือระดับ 1)",
                 font=LABEL_FONT, fg="#888").pack(side="left", padx=4)

        sf = tk.LabelFrame(host, text="Automation — Day schedule (เปลี่ยนโปรไฟล์ตามเวลา, ข้ามเที่ยงคืนได้)", fg="#444")
        sf.pack(fill="x", **pad)
        srow = tk.Frame(sf)
        srow.pack(fill="x")
        self.sched_enabled_var = tk.BooleanVar(value=sch.get("enabled", False))
        tk.Checkbutton(srow, text="เปิดใช้งาน (daemon ต้องรันอยู่)",
                       variable=self.sched_enabled_var,
                       command=self._save_automation).pack(side="left", padx=4)
        self.sched_list = tk.Listbox(srow, height=3, width=30)
        self.sched_list.pack(side="left", padx=4)
        self._refresh_sched_list()
        sbtns = tk.Frame(srow)
        sbtns.pack(side="left", padx=4)
        tk.Label(sbtns, text="เวลา HH:MM:", font=LABEL_FONT).grid(row=0, column=0, sticky="w")
        self.sched_time_var = tk.StringVar()
        tk.Entry(sbtns, textvariable=self.sched_time_var, width=8).grid(row=0, column=1, padx=2)
        tk.Label(sbtns, text="โปรไฟล์:", font=LABEL_FONT).grid(row=1, column=0, sticky="w")
        self.sched_prof_var = tk.StringVar()
        tk.OptionMenu(sbtns, self.sched_prof_var, *(sorted(self.settings.get("profiles")) or [""])).grid(row=1, column=1, padx=2)
        tk.Button(sbtns, text="เพิ่ม", width=8, command=self._sched_add).grid(row=2, column=0, pady=2, sticky="w")
        tk.Button(sbtns, text="ลบที่เลือก", width=10, command=self._sched_remove).grid(row=2, column=1, pady=2, sticky="w")

    def _refresh_game_list(self):
        self.game_list.delete(0, "end")
        for exe, prof in sorted(self.settings.get("auto_profiles").get("games", {}).items()):
            self.game_list.insert("end", "%-32s -> %s" % (exe, prof))

    def _refresh_sched_list(self):
        self.sched_list.delete(0, "end")
        for s in self.settings.get("schedule").get("slots", []):
            self.sched_list.insert("end", "%s  ->  %s" % (s["time"], s["profile"]))

    def _save_automation(self):
        ap = self.settings.get("auto_profiles")
        ap["enabled"] = bool(self.auto_enabled_var.get())
        ap["restore_profile"] = self.auto_restore_var.get()
        self.settings.set("auto_profiles", ap)
        sch = self.settings.get("schedule")
        sch["enabled"] = bool(self.sched_enabled_var.get())
        self.settings.set("schedule", sch)
        self._set_status("บันทึก automation แล้ว (daemon อ่านค่าใหม่ทุก poll — ไม่ต้องรีสตาร์ท)")

    def _game_add(self):
        exe = self.game_exe_var.get().strip().lower()
        prof = self.game_prof_var.get()
        if not exe.endswith(".exe"):
            self._set_status("ระบุชื่อไฟล์ .exe เช่น cyberpunk2077.exe")
            return
        if prof not in self.settings.get("profiles"):
            self._set_status("ไม่รู้จักโปรไฟล์ '%s'" % prof)
            return
        ap = self.settings.get("auto_profiles")
        ap.setdefault("games", {})[exe] = prof
        self.settings.set("auto_profiles", ap)
        self.game_exe_var.set("")
        self._refresh_game_list()
        self._set_status("เพิ่ม %s -> %s แล้ว" % (exe, prof))

    def _game_remove(self):
        sel = self.game_list.curselection()
        if not sel:
            return
        exe = sorted(self.settings.get("auto_profiles").get("games", {}))[sel[0]]
        ap = self.settings.get("auto_profiles")
        ap.get("games", {}).pop(exe, None)
        self.settings.set("auto_profiles", ap)
        self._refresh_game_list()
        self._set_status("ลบ %s แล้ว" % exe)

    def _sched_add(self):
        t = self.sched_time_var.get().strip()
        prof = self.sched_prof_var.get()
        try:
            hh, mm = (int(x) for x in t.split(":"))
            if not (0 <= hh <= 23 and 0 <= mm <= 59):
                raise ValueError
            key = "%02d:%02d" % (hh, mm)
        except ValueError:
            self._set_status("รูปแบบเวลาไม่ถูกต้อง — ใช้ HH:MM เช่น 22:30")
            return
        if prof not in self.settings.get("profiles"):
            self._set_status("ไม่รู้จักโปรไฟล์ '%s'" % prof)
            return
        sch = self.settings.get("schedule")
        sch.setdefault("slots", []).append({"time": key, "profile": prof})
        sch["slots"].sort(key=lambda s: s["time"])
        self.settings.set("schedule", sch)
        self.sched_time_var.set("")
        self._refresh_sched_list()
        self._set_status("เพิ่มตาราง %s -> %s แล้ว" % (key, prof))

    def _sched_remove(self):
        sel = self.sched_list.curselection()
        if not sel:
            return
        sch = self.settings.get("schedule")
        if 0 <= sel[0] < len(sch.get("slots", [])):
            sch["slots"].pop(sel[0])
            self.settings.set("schedule", sch)
            self._refresh_sched_list()
            self._set_status("ลบช่วงเวลาแล้ว")

    # ---------- hotkey editor ----------
    def _update_hotkey_summary(self):
        hk = self.settings.get("hotkeys")
        self.hotkey_summary.config(text="  ".join(
            f"{HOTKEY_LABELS[k]}={v}" for k, v in hk.items()))

    def _open_hotkey_editor(self):
        win = tk.Toplevel(self.root)
        win.title("ตั้งค่า Global Hotkeys")
        win.resizable(False, False)
        win.grab_set()
        tk.Label(win, text="คลิกช่อง แล้วกดคีย์ที่ต้องการ (เช่น Ctrl+Alt+L)",
                 font=LABEL_FONT).pack(padx=12, pady=8)
        entries = {}
        for name, label in HOTKEY_LABELS.items():
            row = tk.Frame(win)
            row.pack(fill="x", padx=12, pady=3)
            tk.Label(row, text=label, width=20, anchor="w").pack(side="left")
            var = tk.StringVar(value=self.settings.get("hotkeys").get(name, ""))
            ent = tk.Entry(row, textvariable=var, width=18, state="readonly",
                           readonlybackground="white")
            ent.pack(side="left")
            entries[name] = var

            def capture(_e, var=var):
                combo = hotkey_from_event(_e)
                if combo:
                    var.set(combo)
                return "break"
            ent.bind("<FocusIn>", lambda e, en=ent: (
                en.config(state="normal"),
                en.bind("<KeyPress>", capture),
                en.focus_set()))
            ent.bind("<FocusOut>", lambda e, en=ent: en.config(state="readonly"))

        def save_and_close():
            hk = self.settings.get("hotkeys")
            for name, var in entries.items():
                hk[name] = var.get()
            self.settings.save()
            self._update_hotkey_summary()
            messagebox.showinfo(APP_TITLE,
                "บันทึกแล้ว — hotkeys จะมีผลหลังรัน daemon ใหม่\n"
                "(ติดตั้ง daemon: Install-Autostart.bat)")
            win.destroy()
        tk.Button(win, text="บันทึก", command=save_and_close, width=12).pack(pady=10)

    # ---------- about ----------
    def _show_about(self):
        messagebox.showinfo("About",
            "Clevo N9xTP6 keyboard backlight — direct EC mailbox protocol,\n"
            "reverse-engineered from this machine's own DSDT (WMBB / cmd 0x67).\n\n"
            "Brightness steps: 63 / 126 / 189 / 252 (EC cmd 0xCA, reg id 0x06)\n"
            "Zone colors: reg ids 0x03/0x04/0x05, payload B/R/G (EC cmd 0xCA)\n"
            "Power: reg id 0x0C = 0x3F on / 0x20 off (EC cmd 0xC4)\n"
            "Speed: reg id 0x02 = 0xFF - speed*0x19 (EC cmd 0xC4)\n\n"
            "Requires Administrator: loads WinRing0x64.sys on demand.\n"
            "Settings auto-save to settings.json; the daemon re-applies them\n"
            "at boot and after sleep/resume.\n"
            "Effect modes are firmware-driven; availability varies by BIOS.")


def hotkey_from_event(event):
    """Tk <KeyPress> -> 'Ctrl+Alt+L' style string (or None for pure modifiers)."""
    mods = []
    if event.state & 0x0004:
        mods.append("Ctrl")
    if event.state & 0x0001:
        mods.append("Shift")
    if event.state & 0x0008:
        mods.append("Alt")      # Tk mod mask 0x0008 = Alt (0x20000 = NumLock!)
    if event.state & 0x40000:
        mods.append("Win")
    key = event.keysym
    if key in ("Control_L", "Control_R", "Shift_L", "Shift_R",
               "Alt_L", "Alt_R", "Win_L", "Win_R", "Meta_L", "Meta_R"):
        return None
    aliases = {
        "Escape": "Esc", "Return": "Enter", "Prior": "PageUp", "Next": "PageDown",
        "space": "Space", "Left": "Left", "Right": "Right", "Up": "Up", "Down": "Down",
    }
    key = aliases.get(key, key)
    if len(key) == 1 and key.isalpha():
        key = key.upper()
    if not mods and len(key) == 1:
        return None              # refuse plain single keys (too intrusive)
    parts = mods + [key]
    seen = set()
    out = []
    for p in parts:
        if p.lower() not in seen:
            out.append(p)
            seen.add(p.lower())
    return "+".join(out)


def _run_smoke_test():
    """Hardware smoke test: drive every GUI action against the real EC.

    Opens a hidden Tk root (the actions use Tk variables/widgets), exercises
    power / brightness / speed / all effect modes / palette / zone colors /
    music start+stop, then restores the settings that were active before the
    test. Writes gui_smoke_test.log next to settings.json. Exit 0 = pass.
    """
    import traceback

    log_path = os.path.join(config.app_base(), "gui_smoke_test.log")
    lines = []

    def p(s=""):
        lines.append(s)
        try:
            print(s, flush=True)
        except Exception:
            pass

    root = tk.Tk()
    root.withdraw()

    # never block on modal error dialogs during the automated run
    messagebox.showerror = lambda *a, **k: None

    app = None
    init_err = None
    try:
        app = App(root)
    except Exception as e:
        init_err = e

    if app is None or app.kb is None:
        p("FAIL  EC init: %s" % (init_err or "EC not available (run as Administrator)"))
        p("smoke test aborted — needs Administrator + working EC")
        with open(log_path, "w", encoding="utf-8") as f:
            f.write("\n".join(lines) + "\n")
        root.destroy()
        sys.exit(1)

    p("EC ready — starting GUI smoke test")
    orig = app.settings.snapshot()
    failures = 0

    def step(name, fn, settle=0.3):
        nonlocal failures
        try:
            fn()
            root.update()
            time.sleep(settle)
            root.update()
            p("ok    %s" % name)
            return True
        except Exception as e:
            p("FAIL  %s: %r" % (name, e))
            p(traceback.format_exc().rstrip())
            failures += 1
            return False

    # --- power / brightness ---
    step("power ON", lambda: app._power(True))
    for lvl in (3, 2, 1, 0, 3):
        step("brightness %d" % lvl,
             lambda l=lvl: (app.brightness.set(l), app._apply_brightness()))

    # --- speed with an active effect mode ---
    step("mode wave (for speed test)",
         lambda: (app.mode_var.set("Wave"), app._apply_mode()))
    for spd in (9, 0, 4):
        step("speed %d" % spd,
             lambda s=spd: (app.speed.set(s), app._apply_speed()))

    # --- every effect mode ---
    for label, _m in MODES:
        step("mode %s" % label.lower(),
             lambda lb=label: (app.mode_var.set(lb), app._apply_mode()))

    # --- palette presets ---
    for hexcol in app.settings.get("palette"):
        step("preset %s" % hexcol, lambda c=hexcol: app._apply_preset(c), settle=0.15)

    # --- per-zone colors ---
    for z, rgb in ((0, (255, 0, 128)), (1, (0, 255, 136)), (2, (0, 128, 255))):
        step("zone %d color" % z, lambda zz=z, cc=rgb: app._set_zone_color(zz, cc))

    # --- music mode (real loopback; silence is fine, device errors are warnings) ---
    try:
        app._music_toggle()
        root.update()
        rend = app.music_rend
        time.sleep(3.0)
        root.update()
        if rend is None or not rend.is_alive():
            p("WARN  music renderer stopped early (no loopback device? see its error)")
        else:
            p("ok    music start (levels: %s)"
              % (tuple(round(float(v), 2) for v in rend.last_levels),))
        app._music_stop()
        root.update()
        p("ok    music stop + restore colors")
    except Exception as e:
        p("FAIL  music mode: %r" % e)
        failures += 1

    # --- color profiles (every named profile, real EC writes) ---
    for pname in sorted(app.settings.get("profiles")):
        step("profile %s" % pname, lambda n=pname: app._apply_profile(n))

    # --- ambient mode (real screen grabs; EC writes verified) ---
    try:
        app._ambient_toggle()
        root.update()
        rend = app.ambient
        time.sleep(3.5)
        root.update()
        if rend is None or not rend.is_alive():
            p("WARN  ambient renderer stopped early (no capture backend?)")
        else:
            p("ok    ambient start (strips: %s)"
              % (tuple(tuple(int(c) for c in s) for s in rend.last_strips),))
        app._ambient_stop()
        root.update()
        p("ok    ambient stop + restore colors")
    except Exception as e:
        p("FAIL  ambient mode: %r" % e)
        failures += 1

    # --- automation: game watcher + day schedule (settings-level, offline-safe) ---
    # --- fan monitor (READ-ONLY — hard guarantee: no EC writes) ---
    step("fan status read",
         lambda: app._fan_refresh())
    step("fan monitor toggle on/off",
         lambda: (app._fan_toggle_watch(), app._fan_toggle_watch()))

    step("automation add game rule",
         lambda: (app.game_exe_var.set("testgame.exe"),
                  app.game_prof_var.set(sorted(app.settings.get("profiles"))[0]),
                  app._game_add()))
    step("automation save (enable toggle)",
         lambda: (app.auto_enabled_var.set(True), app._save_automation()))
    step("automation remove game rule",
         lambda: app._game_remove())
    step("schedule add slot",
         lambda: (app.sched_time_var.set("03:07"),
                  app.sched_prof_var.set(sorted(app.settings.get("profiles"))[0]),
                  app._sched_add()))
    step("schedule remove slot",
         lambda: app._sched_remove())
    # --- profile management (save current + delete, settings-level) ---
    step("profile save current as 'smoketest'",
         lambda: (app.zone_colors.__setitem__(0, (255, 0, 255)),
                  app._profile_save_current_for_test("smoketest")))
    step("profile deleted 'smoketest'",
         lambda: app._profile_delete_for_test("smoketest"))

    step("schedule wrap-midnight unit",
         lambda: None if (config.current_schedule_slot(
             [{"time": "22:00", "profile": "night"}], "02:00") == {"time": "22:00", "profile": "night"}
             and config.current_schedule_slot(
             [{"time": "22:00", "profile": "night"}], "23:00") == {"time": "22:00", "profile": "night"}
             and config.current_schedule_slot([], "10:00") is None)
         else (_ for _ in ()).throw(AssertionError("schedule slot logic")))

    # --- temperature mode (real EC temperature reads) ---
    try:
        app._temp_toggle()
        root.update()
        rend = app.temp_rend
        time.sleep(3.0)
        root.update()
        if rend is None or not rend.is_alive():
            p("WARN  temp renderer stopped early")
        else:
            t = rend.last_temp
            ok = t is not None and 20 <= t <= 120
            p("%s temp start (cpu=%s°C)" % ("ok   " if ok else "WARN ", t))
            if not ok:
                failures += 1
        app._temp_stop()
        root.update()
        p("ok    temp stop + restore colors")
    except Exception as e:
        p("FAIL  temp mode: %r" % e)
        failures += 1

    # --- battery saver (settings round-trip + unit apply paths) ---
    step("battery save (enable)",
         lambda: (app.battery_enabled_var.set(True), app._save_battery()))
    step("battery apply ON-battery variant",
         lambda: config.apply_battery_state(app.kb, app.settings, True))
    step("battery apply back-on-AC",
         lambda: config.apply_battery_state(app.kb, app.settings, False))
    step("battery save (disable)",
         lambda: (app.battery_enabled_var.set(False), app._save_battery()))

    # --- engine defaults panel (settings round-trip, offline-safe) ---
    step("engine defaults save",
         lambda: (app.eng_sens_var.set(1.7), app.eng_mix_var.set(0.55),
                  app.eng_reg_var.set("0x07"), app._save_engine_defaults()))
    step("engine defaults persisted",
         lambda: None if (app.settings.get("engines")["music_sensitivity"] == 1.7
                          and app.settings.get("engines")["temp_reg"] == 0x07)
         else (_ for _ in ()).throw(AssertionError("engine defaults not saved")))
    step("engine defaults reset reg",
         lambda: (app.eng_reg_var.set(""), app._save_engine_defaults()))

    # --- restore pre-test settings ---
    def restore():
        app.settings.data = orig
        app.settings.save()
        app.brightness.set(orig["brightness"])
        app.speed.set(orig["speed"])
        app.mode_var.set(orig["mode"].capitalize())
        app.zone_colors = config.Settings.colors_rgb(app.settings)
        for z, (r, g, b) in enumerate(app.zone_colors):
            app.zone_swatches[z].configure(bg="#%02x%02x%02x" % (r, g, b))
        app._rebuild_profile_buttons()
        config.apply_state(app.kb, orig)
    step("restore previous settings", restore)

    p("")
    p("RESULT: %s (%d failures)" % ("PASS" if failures == 0 else "FAIL", failures))
    with open(log_path, "w", encoding="utf-8") as f:
        f.write("\n".join(lines) + "\n")
    try:
        print("log: " + log_path, flush=True)
    except Exception:
        pass
    root.destroy()
    sys.exit(0 if failures == 0 else 1)


def main():
    if "--selftest" in sys.argv:
        # used by the packaged exe build check: verify imports only
        import clevo_music as _m
        base = (os.path.dirname(sys.executable)
                if getattr(sys, "frozen", False) else os.path.dirname(
                    os.path.abspath(__file__)))
        with open(os.path.join(base, "selftest_ok.txt"), "w", encoding="utf-8") as f:
            f.write("ok soundcard=%s" % getattr(_m, "HAS_SOUNDCARD", False))
        return
    if "--smoke-test" in sys.argv:
        _run_smoke_test()
        return
    root = tk.Tk()
    app = App(root)

    def _on_close():
        app._music_stop()
        app._ambient_stop()
        app._temp_stop()
        if app.fan_watch_stop is not None:
            app.fan_watch_stop.set()
        root.destroy()
    root.protocol("WM_DELETE_WINDOW", _on_close)
    root.mainloop()


if __name__ == "__main__":
    main()
