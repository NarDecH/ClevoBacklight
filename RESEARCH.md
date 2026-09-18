# RESEARCH.md — สรุปการค้นคว้าทั้งหมดของโปรเจกต์ Clevo Backlight Controller

> เอกสารนี้รวบรวม**ทุกสิ่งที่ค้นคว้า / ถอดรหัส / พิสูจน์**ตลอดโปรเจกต์ — ช่องทางที่ตรวจแล้วตัน (พร้อมเหตุผล), โปรโตคอลที่ถอดจากเฟิร์มแวร์ของเครื่องเอง, สถาปัตยกรรมที่เลือกและเหตุผล, บั๊กที่ค้นพบระหว่างทาง และบทเรียนวิศวกรรม — ทุกข้อความอ้างอิงจากการทดลองบนเครื่องจริง ไม่มีการเดา
>
> คู่มือใช้งาน: `README.md` · หน้าเว็บฉบับสวย: `docs/research.html`

---

## 1) เครื่องที่ใช้วิจัย (ค้นพบจาก DMI/SMBIOS จริง)

| รายการ | ค่าที่ตรวจพบ |
|---|---|
| รุ่น / Product code | **Clevo N957TP / N957TP6** |
| CPU / เมนบอร์ด | Intel i9-9900K (desktop CPU) + Z390 — กลุ่ม barebone desktop-CPU จีน |
| BIOS | โดย **dsanke** (สตริง "Modified by dsanke" + Clevo subsystem ID ยืนยัน genuine Clevo) |
| OS | Windows 11 (build 26200) |
| คีย์บอร์ด | PS/2 (ไม่มี USB HID LED control), backlight 3 โซน |

## 2) ช่องทางควบคุมที่ตรวจแล้ว "ใช้ไม่ได้" บนเครื่องนี้

| ช่องทาง | ผล | เหตุผล |
|---|---|---|
| WMI class ของ Clevo (`ABBC0F6D-…` / `CLEVO_GET`) | ❌ | ไม่ถูกลงทะเบียนใน `root\WMI` — BIOS นี้ไม่มี MOF เลย |
| Control Center 3.0 (Microsoft Store) | ❌ | ต้องการไดรเวอร์ DCHU ของ Clevo ที่ไม่มีบน build นี้ |
| `\\.\ACPI` symlink + `WMIB` (วิธีของ ClevoControl/macOS) | ❌ | symlink หายไปบน Windows build นี้ |
| `GetSystemFirmwareTable` | ❌ | ถูกปิด/คืนค่าล้มเหลวบนเครื่อง (ข้อมูลครบเมื่อ elevated เท่านั้น) |
| ALSysIO64.sys (มากับ Core Temp) | ❌ เลี่ยง | ติด flag ว่าเป็น vulnerable driver — ไม่ควรพึ่งพา |
| มาตรฐาน USB HID backlight | ❌ | คีย์บอร์ดเป็น PS/2 ล้วน |

→ สรุป: ต้องเขียนสั่ง **EC โดยตรงผ่านไดรเวอร์ port-I/O** — เหลือทางเดียวคือหา "ภาษา" ของ EC ให้เจอ

## 3) แหล่ง "ภาษา EC" — ถอดจาก DSDT ของเครื่องเอง (จุดเปลี่ยนของโปรเจกต์)

- ดึง ACPI tables ทั้งหมดจาก registry (`HKLM\HARDWARE\ACPI`) ด้วย PowerShell + Python แล้วแปลงด้วย **iasl** (ACPICA, ไฟล์ใน `tools/`)
- ใน `acpi_table_0_DSDT.dsl` เจอ **`SCMD` case `0x67`** (~บรรทัด 24685) คือคำสั่ง `WMBB(0, 0x67, ARGS)` — ช่องทางควบคุม backlight ของ Clevo ทั้งหมด
- OperationRegion **`EC81`** (บรรทัด ~27721) ระบุ mailbox อยู่ที่ **EC RAM 0xF8–0xFC**: `FCMD/FDAT/FBUF/FBF1/FBF2`

### 3.1 คำสั่งที่ถอดได้ (จับคู่กับ subcommand `Local7 = (ARGS >> 0x1C) & 0xF`)

| ARGS | สิ่งที่ EC ทำ |
|---|---|
| 0x0 | สีแบบเก่า 9-บิต: `FDAT=(g\|r<<3\|b<<6)&0xFF`, `FBUF=bit8`, `FCMD=0xC2` |
| 0x1 / 0x2 | เขียนไบต์เดี่ยวลง reg `0x03`/`0x04` (`FCMD=0xC4`) — breathe = `0x2A` ที่ reg 0x03 |
| 0x3 | cycle ทุกโซน: `FDAT=0x06, FBUF=0x01, FBF1=0x03`, `FCMD=0xC4` |
| 0x7–0xB | เอฟเฟกต์: `FDAT=flag, FCMD=0xC4` (0x07 random, 0x08 dance, 0x09 tempo, 0x0A flash, 0x0B wave) |
| 0xD | ความเร็ว: `FDAT=0x02, FBUF=0xFF-(speed*0x19)`, `FCMD=0xC4` |
| 0xE | ไฟ: `FDAT=0x0C, FBUF=0x3F เปิด / 0x20 ปิด`, `FCMD=0xC4` |
| 0xF | สีรายโซน+ความสว่าง (`FCMD=0xCA`): reg id 0x03/0x04/0x05 = payload **B/R/G**, reg id 0x06 = brightness `63/126/189/252` |

**ข้อค้นพบสำคัญ:** ค่า FDAT 0x02–0x0C เป็น **register IDs ของ mailbox** ไม่ใช่ address EC RAM ตรง ๆ (พิสูจน์: EC RAM 0x02–0x0C เก็บข้อมูล fan/thermal)

### 3.2 การยืนยันว่า mailbox "มีชีวิต"
- เขียนคำสั่งแล้ว **FCMD เคลียร์กลับ 0x00 เอง** = เฟิร์มแวร์ EC ประมวลผลแล้ว (ไม่ใช่การเขียนลงเปล่า)
- ทดสอบด้วยสายตา: แดง→เขียว→น้ำเงิน 15 วิ/สี, ความสว่าง 4 ระดับไล่จางครบ

## 4) ชั้นเข้าถึง EC (ความปลอดภัย + ความทนทาน)

- **WinRing0x64.sys** (ลงนาม v1.2.0.5) โหลด on-demand ผ่าน SCM สร้าง service `WinRing0_1_2_0` — บทเรียน: ต้องประกาศ ctypes `restype/argtypes` ครบ ไม่งั้น handle 64-บิตโดน truncation (`CreateService failed: 6`)
- โปรโตคอล ITE ผ่านพอร์ต **0x66 (cmd) / 0x62 (data)**: read = 0x80, write = 0x81 + เช็ก flag **IBF/OBF**
- Hardening: **cross-process mutex** `Global\ClevoBacklightEC` (GUI+daemon+CLI พร้อมกันได้), retry ×3 + backoff, drain OBF กันไบต์ค้าง

## 5) เซ็นเซอร์อุณหภูมิ — ยืนยันข้ามแหล่ง

| EC RAM | ความหมาย | การยืนยัน |
|---|---|---|
| **0x07** | **CPU temp (°C)** | 45 == 45.1°C จาก `MSAcpi_ThermalZoneTemperature` เป๊ะ |
| **0xC7** | **GPU temp (°C)** | field `VGAT` ในบล็อก mirror ของ DSDT (แก้จากข้อสรุปเดิม 0x08) |

**การแก้ไขตามหลักฐาน (v1.9):** บล็อก `OperationRegion (RAM, SystemMemory, 0xFF700100, 0x100)` (บรรทัด 27548+) mirror EC RAM 1:1 — ชื่อ field จึงใช้ตั้งชื่อ address ได้ตรง ๆ: `TMP@0x07` (ยืนยันแล้ว), `VGAT@0xC7` = GPU temp, ส่วน **0x08 คือ `AC1` (trip point ที่ ACPI เขียนลงไป ไม่ใช่ temp สด)** — ข้อสรุปเดิม "0x08 = GPU" ผิด แก้แล้วในโค้ด/เอกสารทั้งหมด

### 5.1 Fan registers (จากบล็อกเดียวกัน — โหมด monitor ตั้งแต่ v1.9.1)

| EC RAM | Field | ความหมาย |
|---|---|---|
| 0x02 | `FAN0` (bit1) / `FAN1` (bit4) | บิตสถานะนโยบายพัดลม (อ่านเชิงข้อมูล — ไม่ใช่สวิตช์ auto/manual ที่คุมพฤติกรรม EC ได้) |
| 0xCE / 0xCF | `DUT1` / `DUT2` | duty พัดลม CPU / GPU (0–255) — **เซลล์ telemetry ที่ EC เขียนเอง** |
| 0xD0 / 0xD2 | `RPM1` / `RPM2` (16-bit) | ความเร็วพัดลม (endianness auto-detect) |

#### Fan tachometer mirror (ค้นพบ + แก้แล้ว, v1.9.10)

การดัมพ์ raw (`ec_fan_dump.py` / `ec_fan_loadtest.py`, อ่านอย่างเดียว) พบว่าบางช่วงเวลา EC **สะท้อนค่าพัดลมเดียวไปทั้งสองช่อง** — `RPM1[0xD0]` = `RPM2[0xD2]` และ `DUT1[0xCE]` = `DUT2[0xCF]` เท่ากันเป๊ะทุก sample (เช่น `05 05` = 1285 @ duty 5% idle) ขณะที่ค่า `3 ↔ 771` ที่เคยอ่านได้คือ **transient ของ tachometer** ไม่ใช่พัดลมหยุดหมุน

→ `read_fan_once` จึงตรวจ mirror (RPM + raw duty เท่ากันเป๊ะทั้งคู่ และไม่ใช่ศูนย์) แล้วรายงาน GPU fan = 0 — Dashboard ไม่แสดงพัดลมหลอก · มี unit test `mirror-collapse` ครอบ · ยืนยันบนเครื่องจริง: `cpu_rpm ≈ 1450, gpu_rpm = 0` ตามสถาปัตยกรรมพัดลมเดียวของเครื่อง

#### Fan control: proven absent (ทดลองบนเครื่องจริง, v1.9.1)

หลักฐาน 3 ชั้นว่า**เขียนสั่งพัดลมผ่าน EC RAM ไม่ได้บนเฟิร์มแวร์นี้**:

1. **เขียนครั้งเดียว โดนทับกลับ** — เขียน DUT1 = 65% แล้วอ่านกลับ: ครั้งแรกได้ 65% จริง แต่ภายใน ~1 วินาที EC ดึงกลับเป็น ~30% ตามนโยบายตัวเอง
2. **ยิงซ้ำ 4 Hz (แบบ NBFC) ก็ยังไม่พอ** — duty ใน register ค้าง 65% ตลอดหน้าต่างทดสอบ แต่ **RPM นิ่งที่ 1452 ไม่ขยับเลย** = EC บันทึกค่าไว้ใน RAM แต่**ไม่เอาไปขับ PWM** — DUT1/DUT2 เป็นเซลล์รายงานสถานะให้ OS อ่านเท่านั้น
3. **ไม่มี write path ใน DSDT** — grep ทุก case ในตัวจัดการ mailbox (`WMBB`) ทั้งหมด: มีแค่ 0x67 (คีย์บอร์ด LED) กับ 0x27 (บล็อกอื่น) — ACPI ไม่เคยเขียน DUT1/DUT2 ด้วย

→ สรุป: v1.9.1 จึงเปลี่ยน `clevo_fan.py` เป็น **monitor อ่านอย่างเดียว** (status / watch 1 Hz + **guarantee ไม่มีการเขียน EC ใด ๆ** ตรวจด้วย mock RAM ใน unit test) และโค้ดเวอร์ชัน controller ถูกลบ — ถ้าพอร์ตไปรุ่นอื่นที่คุมได้ ให้กู้จาก git history ของไฟล์นี้

## 6) สถาปัตยกรรมซอฟต์แวร์ (และเหตุผล)

```
┌─ clevo_ec.py ──── EC/WinRing0 + mailbox protocol + CLI ─┐
├─ engines: music (WASAPI loopback→FFT→3 โซน)             │
│           ambient (mss→3 แถบจอ→gamma/mix)               │
│           temp (EC 0x07→gradient+alarm)                 │
├─ config.py ─ settings.json + validation ทุก section      │
├─ clevo_daemon.py ─ restore/hotkeys/tray/automation/     │
│     health/dashboard/toast/watchdog                      │
├─ GUI (tkinter) + launcher + PyInstaller onefile          │
└─ tests: offline mocks + AST audit + live smoke 13 ขั้น   ─┘
```

- **ทำไม EC ตรง:** ช่องทางทางการใช้ไม่ได้ทั้งหมดบน BIOS นี้ (หัวข้อ 2)
- **ทำไม daemon แยก:** hotkeys/restore ต้องทำงานตลอดโดยไม่เปิด GUI
- **ทำไม offline tests:** EC ต้องใช้ admin + แตะฮาร์ดแวร์จริง — mock ให้ทดสอบโปรโตคอลได้ทุกวัน
- **ทำไม live smoke test (`smoke_test.py`):** อัปเกรด/ติดตั้ง daemon แล้วต้องรู้**ทันที**ว่า API + EC + dashboard ยังตอบครบ — 13 เช็คกับ daemon ที่รันอยู่ (token/endpoint/ค่าสมเหตุสมผล) รันเองใน test_all เมื่อมี daemon อยู่เบื้องหลัง และใช้เป็น gate หลัง deploy ได้

## 7) ฟีเจอร์วิจัยเสริมที่ทำจริง

- **Music reactive:** WASAPI loopback (ไม่อัดไมค์), FFT แยก BASS/MID/TREBLE → โซนซ้าย/กลาง/ขวา, adaptive noise floor, beat detector, RMS per band (pure tone ไม่ถูกเจือจาง) — พิสูจน์ด้วยเสียงสังเคราะห์: 100 Hz→BASS 0.14 vs 0.004, 3 kHz→TREBLE
- **Ambient:** mss (DirectX Duplication) → 3 แถบแนวตั้ง → gamma 1.6 → ผสมสีเดิมตาม Mix — 705 EC writes/6 วิ
- **Automation:** game auto-profile (foreground .exe ทุก 5 วิ), day schedule ข้ามเที่ยงคืน, battery-aware (AC/แบต)
- **Health + Dashboard + Toast** (v1.7–1.8): status.json, history.json, เซิร์ฟเวอร์ localhost:8787, PowerShell WinRT toast
- **Hardware profiles:** map เซ็นเซอร์ต่อรุ่น (`hardware.profile`) + `--dump-ec`/`--diff` หาเซ็นเซอร์เครื่องใหม่
- **LAN security (v1.9.12):** AuthGuard — ทุก token ที่ผิดถูก log IP ลง events.jsonl (`auth_fail`) · ผิด 5 ครั้ง/60 วิ = บลอก IP นั้น 300 วิ (ตอบ 429 แม้ token ถูกภายหลัง) · toast แจ้งเจ้าของเครื่อง (dedup 10 นาที) — unit test ครอบทั้ง logic และ HTTP wiring จริง (401→429→events)
- **Mobile access (v1.9.11):** dashboard `bind: lan` + token บังคับ (fallback loopback ถ้าไม่มี token — กันเว็บเปล่าคุมไฟ) → GUI สร้าง QR จาก LAN IP (UDP trick หา IP ของเกตเวย์) + เปิดไฟร์วอลล์ TCP 8787 ฝั่ง private ผ่าน UAC — มือถือสแกนแล้วเปิด Dashboard พร้อม token ใน URL
- **Release engineering (v1.9.6–1.9.10):** รีโมตสลับ engine จาก dashboard (music/ambient/temp), ตั้งค่า + ปุ่มทดสอบการแจ้งเตือนบนเว็บ (toast/Discord/Telegram), event log JSONL พร้อม viewer, auto-update checker (opt-in — เช็ค GitHub release ทุก 6 ชม. + ปุ่มดาวน์โหลด), **CI สร้าง release เองทั้ง exe + installer จาก tag** (GitHub Actions + Inno Setup) — พิสูจน์ด้วย v1.9.10 ที่ release/อัปเกรดเครื่องนี้จาก zip ของ release จริง

## 8) บั๊กที่ค้นพบ + บทเรียน

| บั๊ก | บทเรียน |
|---|---|
| `CreateService failed: 6` | ctypes ต้องประกาศ restype/argtypes ครบ (handle 64-บิต) |
| GUI `AttributeError: _set_status` (หายตอนรีไรท์ไฟล์ตอนเน็ตหลุด) | เขียน AST auditor จับ `self.x` ที่ไม่มีนิยาม — กันทุกคลาสตลอดไป |
| `self._stop` ทับ `Thread._stop()` → `join()` พัง | ตั้งชื่อ `_stop_ev` + auditor ห้ามชื่อนี้ |
| `CreateWindowExW failed` (monitor ตายมาตั้ง v1.1) | hInstance ต้อง set + HWND 64-bit ต้องมี prototype |
| stdout `detach()` กันปิด buffer ร่วมกัน | wrapper stdout ภายใต้ pythonw ต้องระวัง ownership |
| uninstaller ลบ Scheduled Task ชื่อชน (`ClevoBacklightDaemon` ใช้ทั้ง installer และโปรเจกต์) | แยกชื่อ task installer = `ClevoBacklightAutostart` + **ทดสอบ install→uninstall จริงทุกรอบ** (จับได้ตอนทดสอบ 1.9.7) |
| `ISCC` รุ่นใหม่ไม่รู้จัก flag `uncheckedonce` | ใช้ flag มาตรฐาน + ทดสอบ `/D` version override กับ ISCC จริงก่อนใส่ CI |
| battery automation ตายเงียบมาตั้งแต่ v1.6 (thread crash รอบเดียวแล้วหายไป) | struct ของ `GetSystemPowerStatus` ต้องเป็น `ctypes.Structure` — plain class ที่มี `_fields_` ทำ `byref()` throw ทันที · AST audit จับไม่ได้ (runtime type) — ต้องมี unit test เรียก `_power_status()` ตรง ๆ (แก้ + จับได้ v1.9.12) |
| **remote control deadlock** (v1.9.12, จับตัวด้วย py-spy) | ห้ามเรียก `connect()` ขณะถือ `self.lock` — `threading.Lock` เป็น non-reentrant, `connect()` ขอ lock เดิมซ้ำ = ค้างถาวร + ลาก health/watchdog/POST แข็งตามทั้งโปรเซส · py-spy dump บน daemon จริงคือเครื่องมือชี้ขาด (ทุก thread ยืนที่ `connect` บรรทัดเดียวกัน) |
| battery loop re-apply ทุก 10 วิบน AC (v1.9.12) | เงื่อนไข dedup ใช้ `on is False` ผิดขั้ว (`on` = ใช้แบต) → `level_changed` True ตลอดบน AC = เขียน EC ไม่จำเป็น + แย่ง EC lock — dedup ต้องทดสอบทั้งสองขั้วของตัวแปรสถานะ |

## 9) ช่องทางที่ "ยังเปิด" สำหรับงานต่อ

- เพิ่ม map เซ็นเซอร์/คำสั่งรุ่นอื่นใน `clevo_temp.HW_DEFAULTS` (ใช้ `ec_sensor_finder.py` หรือ `--dump-ec --diff` สำรวจ)
- อ่านค่ากลับจาก mailbox (`FCMD=0xB8` — pattern ใน DSDT บรรทัด 23535/24376)
- ❌ ~~fan control~~ — **พิสูจน์แล้วว่าทำไม่ได้บนเฟิร์มแวร์นี้** (v1.9.1 จึงเปลี่ยน `clevo_fan.py` เป็น monitor อ่านอย่างเดียว — ดูหัวข้อ "Fan control: proven absent")

---
*รวบรวมอัตโนมัติจากบันทึกโปรเจกต์ · ทุกค่าในตารางมาจากการทดลองจริงบน N957TP6 · อัปเดตล่าสุด 2026-09-18 (v1.9.13) · หน้าเว็บฉบับสวย: `docs/research.html`*
