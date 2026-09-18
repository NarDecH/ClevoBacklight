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
- **Profile editor จากมือถือ + PWA (v1.9.15):** `POST /api/profiles` (allow_control) → `config.upsert_profile` normalize สี/mode/ความสว่าง/ชื่อ (กันชื่อ password*, จำกัด 24 ตัวอักษร) ก่อนเขียน settings · หน้าเว็บ**ติดตั้งเป็นแอปมือถือได้** (manifest + service worker แบบ network-first, offline shell เฉพาะหน้า HTML — **API ไม่ถูก cache และ token ไม่มีทางตกค้างใน cache**)
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
| **remote control deadlock** (v1.9.12, จับตัวด้วย py-spy) | ห้ามเรียก `connect()` ขณะถือ `self.lock` — `threading.Lock` เป็น non-reentrant, `connect()` ขอ lock เดิมซ้ำ = ค้างถาวร + ลาก health/watchdog/POST แข็งตามทั้งโปรเซส · py-spy dump บน daemon จริงคือเครื่องมือชี้ขาด (ทุก thread ยืนที่ `connect` บรรทัดเดียวกัน) · **กันซ้ำถาวร: `audit_locks.py` สแกน pattern นี้อัตโนมัติใน test_all ทุกครั้ง (v1.9.14)** |
| battery loop re-apply ทุก 10 วิบน AC (v1.9.12) | เงื่อนไข dedup ใช้ `on is False` ผิดขั้ว (`on` = ใช้แบต) → `level_changed` True ตลอดบน AC = เขียน EC ไม่จำเป็น + แย่ง EC lock — dedup ต้องทดสอบทั้งสองขั้วของตัวแปรสถานะ |

## 9) ช่องทางที่ "ยังเปิด" สำหรับงานต่อ

- เพิ่ม map เซ็นเซอร์/คำสั่งรุ่นอื่นใน `clevo_temp.HW_DEFAULTS` (ใช้ `ec_sensor_finder.py` หรือ `--dump-ec --diff` สำรวจ)
- อ่านค่ากลับจาก mailbox (`FCMD=0xB8` — pattern ใน DSDT บรรทัด 23535/24376)
- ❌ ~~fan control~~ — **พิสูจน์แล้วว่าทำไม่ได้บนเฟิร์มแวร์นี้** (v1.9.1 จึงเปลี่ยน `clevo_fan.py` เป็น monitor อ่านอย่างเดียว — ดูหัวข้อ "Fan control: proven absent")

## 10) สรุปสุขภาพระบบจาก log จริง (audit 24 ชม., v1.9.13)

| หมวด | ผล | หมายเหตุ |
|---|---|---|
| daemon start | 13 ครั้ง | ส่วนใหญ่จากวงจรทดสอบสลับเวอร์ชัน |
| EC fail / recover | **0** | ธุรกรรม EC นิ่งทั้ง 24 ชม. |
| engine stop ผิดปกติ | 0 | — |
| `auth_fail` | 6 ครั้ง | **ทั้งหมดจาก 127.0.0.1** = traffic ทดสอบของโปรเจกต์เอง ไม่มีผู้ไม่หวังดีจริง |
| error ใน daemon.log | 2 ครั้ง | `CreateWindowExW failed; monitor disabled` (16–17 ก.ย.) — monitor ปิดตัวเองอย่างปลอดภัย, ไม่กระทบ daemon |

→ ระบบหลัง deploy v1.9.13 ทำงานสะอาด · events.jsonl ใช้ตรวจย้อนหลังได้จริง (viewer/filter บน dashboard หรือ CLI `--export-events`)

## 11) PWA/offline บนมือถือ (v1.9.15–16)

**สถาปัตยกรรมฝั่ง client (dashboard.html + sw.js) — สรุปการตัดสินใจ:**

| กลไก | การตัดสินใจ | เหตุผล |
|---|---|---|
| SW cache `/api/status` | **cache-first + TTL 15 วิ**, cache key คงที่ (`/api/status` ไม่ผูก query) | สด 15 วิพอสำหรับ refresh 5 วิ · offline ยังเรนเดอร์ได้ · **token ไม่มีทางตกค้างใน key** |
| API อื่นทั้งหมด | ไม่ cache เด็ดขาด (network-only) | กันข้อมูล/token เก่าหลุดออกจากอุปกรณ์ |
| สถานะล่าสุด | เก็บซ้ำใน `localStorage` (`cb_laststatus`) ทุกครั้งที่ tick สำเร็จ | SW ครอบเฉพาะเบราว์เซอร์ที่ลง SW แล้ว — localStorage รองรับกรณีเปิดครั้งแรกแล้ว daemon ตายทีหลัง |
| คำสั่งตอนออฟไลน์ | คิว `localStorage` (สูงสุด 20, เก่าทิ้ง) → flush **เก่าก่อนใหม่** เมื่อ tick/online event สำเร็จ | UX ปุ่มกดได้เสมอ · 401/403 = ล้างคิว (ถือว่าถูกปฏิเสธ) · server ตอบ error อื่น = หยุดรอรอบหน้า |
| Preview สี | action `preview` บน `/api/cmd`: validate ด้วย `config.validate_profile_payload` (ตัวเดียวกับบันทึก) → `apply_state` เข้า EC — **ไม่เขียน settings** | ลองสีได้ไม่อั้นโดยเสี่ยงศูนย์ · ปิด daemon = กลับสู่โปรไฟล์จริงอัตโนมัติ · refactor กัน validate สองทางไม่ตรงกัน |
| Export/Import โปรไฟล์ | ไฟล์ JSON client-side ผ่าน API เดิม (`{exported, profiles}` wrapper หรือ bare map) | ไม่เพิ่ม endpoint · นำเข้าผ่าน validation เดิมทุกขั้น — ไฟล์แปลกปลอมสร้างโปรไฟล์ไม่ได้ |

**ข้อจำกัดที่ยอมรับ:** SW TTL ทำให้สถานะเก่าสุด 15 วิตอนออฟไลน์ (แสดงแบนเนอร์ชัดเจน) · คิวคำสั่งไม่มี guarantee ระดับ transaction — ถ้าระหว่างออฟไลน์ผู้ใช้เปลี่ยนใจ ต้องกดทับ (คำสั่งเก่าถูกส่งตามก่อน) — ยอมรับได้เพราะทุก action idempotent ในทางปฏิบัติ (power/brightness/profile ล้วน set-absolute)

---

## 12) Auto-profile ตามแอปฟื้กซ์ (v1.9.17)

**โจทย์:** เปิดเกมแล้วไฟควรเปลี่ยนเป็นโปรไฟล์เกมเอง ปิดแล้วคืนเป็นโปรไฟล์ทำงาน — โดยไม่ต้องตั้ง schedule ตามเวลา

| ด้าน | การตัดสินใจ | เหตุผล |
|---|---|---|
| ตรวจแอปฟื้กซ์ | `GetForegroundWindow` + `GetWindowThreadProcessId` + `OpenProcess(PROCESS_QUERY_LIMITED_INFORMATION)` + `QueryFullProcessImageNameW` → ตัด basename → lowercase | lightweight ทุก 5 วิไม่หนักเครื่อง · query-limited ไม่ต้องสิทธิ์พิเศษ · **ไม่แตะ window title** (กันเหนียบกับเกม anti-cheat บางตัวที่เฝ้า title) — *v1.9.18: เดิมใช้ `GetModuleBaseNameW` ซึ่ง**ใช้ไม่ได้จริง**กับ mask นี้ ดูหัวข้อ 13* |
| ตัดสินใจ | `exe` → กฎ `games[exe]` → `apply_profile` เดิม; แอปที่มีกฎออกจากฟื้กซ์ + ตั้ง `restore_profile` → คืนโปรไฟล์ | ตัดสินใจทุกรอบเป็น state machine เดียว: `decision != _auto_state` ครั้งเดียวจบ — debounce ฟรี, รองรับสลับไปมาระหว่างเกม |
| ลำดับความสำคัญ | game watcher ชนะ schedule ตามเวลา (schedule ทำงานเมื่อ watcher "ไม่มีคำตอบ") | คนเปิดเกมตอนตีสองก็ควรได้โปรไฟล์เกม ไม่ใช่โปรไฟล์กลางคืน |
| API | `GET/POST /api/auto_profiles` · POST ผ่าน `config.upsert_auto_profiles` · ลบกฎด้วยค่า `null` | ตามแบบ `/api/profiles` เดิมทุกด้าน (allow_control + atomic validate + events log) |
| Validation | exe ต้องลงท้าย `.exe` + normalize lowercase · โปรไฟล์ต้องมีอยู่จริง · **ล้มทั้ง POST ถ้าแถวใดแถวหนึ่งพัง** | atomic กันสถานะครึ่ง ๆ กลาง ๆ · กฎหลุดชี้ profile ลบไปแล้วไม่มีทางค้าง |
| UI | การ์ดใหม่ใน Dashboard (โชว์เมื่อ `allow_control` เท่ากับการ์ดแต่งโปรไฟล์): ฟอร์มเพิ่มกฎ + tag รายการกฎพร้อมปุ่มลบ + ตัวเลือก restore + เปิด/ปิด | มือถือตั้งกฎจบในจอเดียว ไม่ต้องแก้ settings.json |

**บั๊กที่ test จับได้รอบแรก:** คำสั่งลบกฎ (`{"games": {"x.exe": null}}`) โดน validate "profile ต้องมีจริง" ปฏิเสธก่อนถึงสาขาลบ — แก้โดยแยก `prof is None` เป็นเส้นทางลบก่อน validate (บทเรียนซ้ำของโปรเจกต์: *คำสั่ง "ลบ" ต้องเป็น first-class case ใน validator ไม่ใช่ค่าที่ผ่าน validate แบบตั้ง/แก้*)

**ข้อจำกัดที่ยอมรับ:** รู้จำแอปจากชื่อ `.exe` เท่านั้น (ไม่อ่าน path) — สองเกมชื่อ exe เดียวกันถือเป็นอันเดียว · UWP/เกม Store บางตัวรายงาน exe ตัวกลาง (เช่น `applicationframehost.exe`) จึงควรกฎด้วยชื่อที่เห็นจริงใน tag ของการ์ด (กดเพิ่มจากชื่อที่ daemon เห็นไม่ได้เพราะ UI ไม่รู้ — อนาคต: ปุ่ม "จับแอปฟื้กซ์ปัจจุบัน")

## 13) บทเรียน Win32 access mask — GetModuleBaseNameW กับ PROCESS_QUERY_LIMITED_INFORMATION (v1.9.18)

**อาการ:** ฟีเจอร์ auto-profile ที่ประกาศว่า "เสร็จแล้ว" ใน v1.9.17 ใช้ไม่ได้จริงบนเครื่อง — กฎ notepad.exe ไม่เคยจับคู่ ทั้งที่ daemon รัน elevated

**การไล่หลักฐาน (รอบเดียวจบเพราะเทียบรายขั้น):** `FindWindowW` เจอ notepad → `foreground_exe()` คืน `''` ซ้ำ ๆ → เปิดขยายฟังก์ชันทีละค่า: `GetForegroundWindow` = hwnd จริง · `GetWindowThreadProcessId` = pid จริง · `OpenProcess(0x1000)` = handle จริง · `GetModuleBaseNameW` = **0 และ `GetLastError()` = 5 (ERROR_ACCESS_DENIED)**

**สาเหตุ (ความรู้ที่เอกสาร MS เขียนไว้แต่มองข้ามง่าย):** `GetModuleBaseNameW` ต้องการ `PROCESS_VM_READ` นอกจาก query — แต่ mask `PROCESS_QUERY_LIMITED_INFORMATION` **ไม่รวม** `PROCESS_VM_READ` และไม่มีทางรวมได้เพราะเป็น "limited" ที่ออกแบบให้เรียกได้แม้กับ process ที่สูงกว่า → ผลคือฟังก์ชันคู่นี้**เข้ากันไม่ได้โดยดีไซน์** กับ process integrity สูงกว่า (และพาดหลายเคสอื่น) — จุดพิษคือ `OpenProcess` สำเร็จ ทำให้โค้ดดูถูกต้อง และ try/except ในฟังก์ชันกลืนอาการเป็น `''` เงียบ ๆ

**ทางแก้ที่ถูกต้อง:** `QueryFullProcessImageNameW(handle, 0, buf, &size)` — API ที่ออกแบบมาสำหรับ mask limited โดยเฉพาะ ทำงาน unprivileged กับ process ใด ๆ → ตัด basename เองจาก path เต็ม

**บทเรียนวิศวกรรม (สำคัญกว่าบั๊กเอง):**
1. **"คอมไพล์ผ่าน + ไม่ raise" ≠ ทำงาน** — ฟังก์ชันที่ wrap try/except แล้วคืนค่าว่างเมื่อล้ม ทำให้ failure มองไม่เห็นเลยทั้ง test ทั้ง field ต้อง test "สายสัญญาณจริง" (ยิง API จริงดูค่า)
2. **การเทียบรายขั้น (differential probe) หาบั๊กแบบนี้ได้ในรอบเดียว** — แทนที่จะเดา เปิดขยายทีละ call พร้อม `GetLastError()`
3. **ฟีเจอร์ที่แตะ OS boundary ต้องผ่าน live e2e ก่อนประกาศเสร็จ** — unit test ที่ mock ทุกอย่างไม่มีทางจับ mismatch ระดับ access mask (test contract ใหม่จับได้แค่ว่า wiring ถูก ส่วน e2e จับว่า OS ยอมจริง)
4. บทเรียนซ้ำของโปรเจกต์: *ของที่ยังไม่เคยรันจริงบนเครื่อง = ยังไม่เสร็จ* (รอบนี้คือเคสที่สอง ต่อจาก deadlock v1.9.13 ที่จับด้วย py-spy)
5. **บั๊กพี่น้องที่ตามมาในวันเดียว (v1.9.19):** สคริปต์ PowerShell เขียน settings.json แบบ UTF-8 **มี BOM** → loader ใช้ `utf-8` เปลี่ยน `\ufeff` เป็นชื่อ key แรก → settings ทั้งไฟล์ฟอลแบ็ก defaults **เงียบ ๆ** (token หาย = dashboard เปิดกว้าง) จับได้เพราะ smoke assert 401 แต่ได้ 200 — แก้ loader เป็น `utf-8-sig` + regression test บทเรียน: silent fallback ของ config ต้องถูกออกแบบให้ "ผิดแล้วมองเห็น" (401→200 คือสัญญาณที่ test ต้อง assert ไว้)

## 14) Auto-profile observability + config transparency (v1.9.20)

**โจทย์:** หลัง v1.9.18 แก้ access mask แล้ว ยังขาดอีก 3 อย่างของระบบ automation ที่ดี: รู้ว่ากฎกำลังทำอะไร (observability), รู้ทันทีเมื่อมันสลับ (feedback), และรู้ทันทีเมื่อ config พัง (transparency)

| ฟีเจอร์ | การตัดสินใจ | เหตุผล |
|---|---|---|
| ปุ่มจับแอปฟื้กซ์ | `GET /api/foreground` (gate allow_control) + ปุ่มบนการ์ดเติมฟอร์ม | ปัญหาจริง: ผู้ใช้ไม่รู้ชื่อ exe ที่ daemon เห็น (UWP รายงาน `applicationframehost.exe`) — ตัว daemon ต้องเป็นคนบอก ไม่ใช่ให้เดา |
| แจ้งเตือนสลับ | `notify("auto_profile")` ใช้ช่องทางเดิมทั้งหมด (toast/Discord/Telegram) + event ใหม่ `auto_profile` | ไม่สร้าง pipeline ใหม่ — ใช้ gate/dedup/hook ที่มี · **default ปิด** เพราะ notification ที่ทุกคนได้โดยไม่ได้ขอ = สแปม |
| dedup สลับไปมา | ข้อความเดียวกัน ยับ 10 นาที (`_auto_last_msg` + `_auto_last_ts`) | เกมล้ม/โฟกัสสลับเร็วคือเคสปกติ — ต้องยับที่ฝั่ง message ไม่ใช่ฝั่งช่องทาง |
| สถานะกฎสด | `auto_active` (decision string ตัด `@`) + `auto_exe` ใน `/api/status` และ status.json | status.json เขียนโดย health loop อยู่แล้ว — เพิ่ม 2 key จบ ไม่ต้องไฟล์/ระบบใหม่ · **ไม่ใส่ใน history ring** เพื่อกัน key แปลกปลอมจาก status.json ไหลเข้าหน้าเว็บ (status.json เป็นแหล่งที่ test ยังเขียนมือได้) |
| config transparency | `Settings.load_info()` + `config_ok`/`config_error` ใน status + chip เตือนบนหน้าเว็บ | บทเรียน v1.9.19 ตรง ๆ: silent fallback ต้องกลายเป็นสัญญาณที่มองเห็น — test ตรวจเคสไฟล์หาย (สะอาด) แยกจากไฟล์พัง (ต้องมีเหตุผล) |

**บั๊กที่ test จับระหว่างทำ:** `self._load_info = ""` ถูกวาง**หลัง** `self._load()` ใน `__init__` ทำให้เหตุผลที่ record ไว้ถูกทับด้วยค่าว่างเสมอ — ลำดับการกำหนด state ก่อนเรียก loader คือสัญญาณเสี่ยงที่ควรสังเกต (แก้: ตั้งค่าเริ่มต้นก่อน, loader เขียนทับเมื่อมีเหตุผลจริง)

**บทเรียนซ้ำ:** make_daemon (test helper สร้าง daemon ด้วย `__new__`) ลืม attrs ใหม่ได้ทุกรอบที่เพิ่ม field — ทางแก้เชิงโครงสร้างคือให้ attrs เหล่านี้มีค่า default ที่ระดับ class หรือทำ test helper ให้ sync อัตโนมัติ (ยังไม่ทำ — ยอมรับความเสี่ยงเพราะ test ทันทีที่ลืม)

---
*รวบรวมอัตโนมัติจากบันทึกโปรเจกต์ · ทุกค่าในตารางมาจากการทดลองจริงบน N957TP6 · อัปเดตล่าสุด 2026-09-18 (v1.9.20) · หน้าเว็บฉบับสวย: `docs/research.html` · ความปลอดภัย: `SECURITY.md`*
