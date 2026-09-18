# Changelog

รูปแบบอ้างอิง [Keep a Changelog](https://keepachangelog.com/) — เวอร์ชันตามเสถียรภาพของฟีเจอร์ (ไม่มี release สาธารณะ ใช้ภายในเครื่อง)

## [1.9.15] — 2026-09-18

### Added
- **แต่งโปรไฟล์สีจากมือถือ** — แผงใหม่บน Dashboard (color picker 3 โซน + ความสว่าง + เอฟเฟกต์ + ความเร็ว): บันทึกเป็นโปรไฟล์ใหม่/แก้ตัวเดิม แล้วกด "ใช้ทันที" ได้ในคลิกเดียว · API ใหม่ `GET/POST /api/profiles` (การเขียนต้องเปิด allow_control) ผ่าน `config.upsert_profile` ที่ validate ทุกค่า (สี 3 ช่อง, mode ที่มีจริง, brightness 0–3, speed 0–9, ชื่อ ≤24 ตัวอักษร และกันชื่อขึ้นต้น password) · ทุกความพยายามเขียน log ลง events.jsonl (`profile_upsert`)
- **ติดตั้ง Dashboard เป็นแอปมือถือ (PWA)** — `manifest.webmanifest` + service worker + ไอคอน 192/512 (สร้างจาก PIL) · strategy **network-first**: ข้อมูลสดเสมอ, API ไม่ถูก cache (token ไม่มีทางตกค้าง), offline shell แสดงแบนเนอร์ "ออฟไลน์" เมื่อ daemon เข้าไม่ถึง · ไฟล์ static ถูก bundle ใน exe ผ่าน spec แล้ว
- **`SECURITY.md`** — สถาปัตยกรรมความปลอดภัย 7 ชั้น (loopback default → LAN fallback → token → AuthGuard → allow_control → validation → firewall Private) + threat model + แนวปฏิบัติ

### Verified
- test suite ผ่านครบ: profiles endpoint (create/update/400×5/PWA static), auth guard, lock audit, smoke 15 เช็ค

## [1.9.14](https://github.com/NarDecH/ClevoBacklight/releases/tag/v1.9.14) — 2026-09-18

### Added
- **การ์ดคุมไฟครบสมบูรณ์บน Dashboard** — เพิ่ม**สไลเดอร์ความสว่าง 0–3** (ส่งคำสังตอนปล่อยนิ้ว + แสดงระดับปัจจุบันจาก `/api/status.brightness`) และ**ปุ่มโปรไฟล์ทุกตัวในการ์ดเดียว** พร้อมไฮไลต์โปรไฟล์ที่ใช้งาน (`/api/status.profile`)
- **Lock auditor** (`audit_locks.py`) — กัน deadlock ซ้ำถาวร: จับ `self.connect()` ภายใต้ `with self.lock:` (บทเรียน v1.9.13) ทำงานอัตโนมัติใน test_all (ขั้น 2b) พร้อม self-test ยืนยันว่า flag เคสผิดและผ่านเคสถูก

### Fixed
- **สลับโปรไฟล์จากรีโมตไม่ mark เป็น active** — เดิม remote ใช้ `apply_state` ตรง ๆ ทำให้ไฟเปลี่ยนแต่ไฮไลต์/`active_profile` ค้างเดิม — เปลี่ยนเป็น `apply_profile` (mark + save + push ครบ) · `/api/status` ส่ง `profile` + `brightness` ให้การ์ดใช้

## [1.9.13] — 2026-09-18

### Fixed
- **Deadlock ของ remote control (จับตัวได้ด้วย py-spy)** — `remote_command` ถือ `self.lock` แล้วเรียก `connect()` ซึ่งขอ lock เดียวกันซ้ำ (non-reentrant) → thread ผู้เรียกค้างถาวร และ health/watchdog/POST ถัดไปแข็งตามทั้งหมด (สังเกตจาก status.json หยุดอัปเดต + POST /api/cmd hang) — แก้โดยเรียก `connect()` ก่อนเข้า lock พร้อม comment อธิบาย + สแกนหา pattern ซ้ำทั้งไฟล์ (ไม่พบจุดอื่น)
- **battery loop re-apply ทุก 10 วิเมื่ออยู่บน AC** — เงื่อนไข `level_changed` ใช้ `on is False` (แปลว่า "บน AC") ทำให้ True ตลอด → เขียน EC ไม่จำเป็น + แย่ง EC lock — แก้เป็น `on is True` (dimming ตามระดับแบตใช้ตอนถอดปลั๊กเท่านั้น)
- **Dashboard server → `ThreadingHTTPServer`** — single-thread เดิมทำให้ request หนึ่งค้างแล้วบังคิวทั้งเซิร์ฟเวอร์
- POST `/api/cmd` ที่ action ไม่รู้จักตอบ **400** แทน 500 (ValueError = คำขอผิด) — smoke test ครอบเคสนี้ตอน allow_control เปิด

## [1.9.12](https://github.com/NarDecH/ClevoBacklight/releases/tag/v1.9.12) — 2026-09-18

### Added
- **เกราะป้องกัน LAN (AuthGuard)** — ทุกความพยายามยิง token ผิดถูกบันทึก IP ลง events.jsonl (`auth_fail`) · ผิด 5 ครั้งใน 60 วิ = **บล็อก IP นั้น 5 นาที** (ตอบ 429 แม้ token ถูก) · toast + Discord/Telegram แจ้ง "มีความพยายามเดา token" (dedup ทุก 10 นาที ไม่สแปม)
- **การ์ดคุมไฟจากมือถือ** — ปุ่มใหญ่บน Dashboard แสดงสถานะจริง (💡 เปิด / 🌑 ปิด) แตะสลับ + แถวความสว่าง 0–3 · แสดงเมื่อเปิด `allow_control` เท่านั้น
- `test_auth_guard.py` — logic (limit/block/expiry/notify dedup) + HTTP wiring จริง (401→429→events) · test_all ขั้น [8/9]

### Changed
- หัวข้อเวอร์ชันที่มี release แล้ว (v1.9.9+) เชื่อมลิงก์ไปหน้า GitHub Releases ตามรูปแบบ Keep a Changelog (ส่วน v1.9.0–v1.9.8 ตรวจแล้วว่าจัดรูปแบบ Added/Changed/Fixed ถูกต้องอยู่แล้ว)

## [1.9.11](https://github.com/NarDecH/ClevoBacklight/releases/tag/v1.9.11) — 2026-09-18

### Added
- **Mobile access — เปิด Dashboard จากมือถือ**: แผงใหม่ใน GUI ("Mobile access") ตรวจเงื่อนไข bind=lan + token → สร้าง QR สแกนเปิดเว็บจากมือถือใน Wi-Fi เดียวกัน (มีปุ่มคัดลอกลิงก์ + ปุ่มเปิดไฟร์วอลล์ TCP 8787 ฝั่ง private ผ่าน UAC)
- **`smoke_test.py` — end-to-end smoke test กับ daemon ที่รันอยู่**: token auth, dashboard HTML, API ครบทุก endpoint (status/daily/history.csv/notify-config/events/events.jsonl/update/weekly), ค่า EC สมเหตุสมผล, POST ไม่ 500 — exit code ชัดเจน ใช้เป็น gate หลัง deploy/อัปเกรดได้ (`python smoke_test.py [--port 8787] [--token …] [--no-ec]`)
- test_all.bat ขั้น **[8/8]**: รัน smoke อัตโนมัติเมื่อมี daemon ฟังพอร์ตอยู่ (auto-skip เมื่อไม่มี — ไม่พังบน CI)

### Changed
- เก็บกวาด repo + เครื่อง: ลบ bat release script รุ่นเก่า 10 ไฟล์ + สคริปต์ทดสอบครั้งเดียว, เลิก track log 7 ไฟล์ (ปิดรูด้วย `*.log` ใน .gitignore), ลบ zip release เก่าในเครื่อง 13 ไฟล์ + installer เก่า 5 ไฟล์ + build/ + staging (~660 MB รวม) — dist เหลือเฉพาะตัวรันจริง + runtime state
- คู่มือ docs/index.html: การ์ดฟีเจอร์ v1.9.x ครบ, แก้ข้อมูล GPU temp เป็น 0xC7, ตารางทดสอบเป็นรอบ 8 ขั้น + CI, หัวข้อ 09 ระบบเสริม
- RESEARCH.md + docs/research.html: เพิ่มผลวิจัย fan tachometer mirror (v1.9.10), ส่วน release engineering, บั๊ก task-ชน/ISCC flag

### Fixed
- smoke_test.py ทน network hiccup (WinError 10053): retry ×2 + fail-soft แทน traceback

## [1.9.10](https://github.com/NarDecH/ClevoBacklight/releases/tag/v1.9.10) — 2026-09-17

### Added
- **ปุ่มดาวน์โหลดอัปเดตบน Dashboard** — เมื่อ `/api/update` เจอ release ใหม่กว่า ปุ่ม "⬇ ดาวน์โหลด" ใน chip เวอร์ชัน สั่ง daemon ดึง zip ของ release นั้นไว้ข้างโปรแกรม (background thread, ไม่ auto-install) ผ่าน `POST /api/update/download` — 409 เมื่ออัปเดตแล้ว, event log ทุกคำขอ
- สคริปต์วินิจฉัยพัดลม `ec_fan_dump.py` / `ec_fan_loadtest.py` (อ่านอย่างเดียว)

### Changed
- **fan read**: EC ของเครื่องนี้ mirror tachometer พัดลมเดียวไปทั้งสองช่อง (พิสูจน์ด้วยการดัมพ์ raw) — `read_fan_once` ยุบช่อง GPU เป็น 0 เมื่อสองช่องเหมือนกันเป๊ะ เพื่อไม่ให้ Dashboard โชว์พัดลมหลอก
- ตรวจสอบ mapping พัดลมซ้ำตาม DSDT: RPM1@0xD0/RPM2@0xD2 และ DUT1/2 ยังถูกต้อง — ค่าที่เพี้ยนช่วงก่อนคือ transient ของ tachometer ไม่ใช่บั๊กโปรแกรม

## [1.9.9](https://github.com/NarDecH/ClevoBacklight/releases/tag/v1.9.9) — 2026-09-17

### Added
- **Music viz สดบน Dashboard** — แผงเอนจินแสดงกราฟแท่ง 3 โซน (ซ้าย/กลาง/ขวา) เต้นตามระดับเสียงที่เอนจินเพลงเห็นจริง (`music_levels` ใน `/api/status`) พร้อม history ~5 วิ · ซ่อนอัตโนมัติเมื่อเอนจินหยุด
- **Events viewer บน Dashboard** — ตารางเหตุการณ์ทั้งหมดจาก `events.jsonl` พร้อม**กรองตามชนิด** + **ค้นหาข้อความ** + ปุ่มดาวน์โหลดดิบ (`GET /api/events.jsonl`, ปิดได้ด้วย `dashboard.serve_history_csv`) · รีเฟรชทุก 15 วิ

## [1.9.8] — 2026-09-17

### Added
- **Structured event log** — `events.jsonl` (JSON Lines): daemon start, เปลี่ยน settings, เอนจิน start/stop (พร้อมเหตุผล), การแจ้งเตือน, update events — วิเคราะห์/filter ย้อนหลังได้ · dashboard โชว์ผ่าน `GET /api/events` · CLI `--export-events` (ไม่ต้องแอดมิน) · ตัดไฟล์เก่าอัตโนมัติเมื่อเกิน ~5,000 เส้น
- **ตั้งค่าแจ้งเตือนบน Dashboard** — แผงใหม่เปิด/ปิด toast ทุกชนิด + เกณฑ์อุณหภูมิ + Discord webhook และ**ปุ่มส่งข้อความทดสอบ** (`GET/POST /api/notify-config`, `POST /api/notify-test`) — บันทึกแล้ว daemon ใช้ทันที (การเขียนค่าต้องเปิด allow_control)
- **Auto-update checker (opt-in)** — settings `updates` (enabled/repo/interval): daemon ตรวจ GitHub releases ตามรอบ (default 6 ชม.) เจอเวอร์ชันใหม่ → toast + event log (dedup ต่อเวอร์ชัน) · Dashboard มี chip สถานะเวอร์ชัน (`GET /api/update`) · ไม่ auto-install — แค่แจ้งและดาวน์โหลดเมื่อสั่ง

## [1.9.7] — 2026-09-17

### Added
- **Telegram notifications** — settings `notifications.telegram_token` / `telegram_chat_id` (สองช่องในแผง Notifications ของ GUI, token ซ่อนเป็น ***): ทุกแจ้งเตือน + สรุปรายวันส่งเข้า Telegram ควบคู่ Discord/toast (plain HTTP, พลาดแล้ว log แทน crash)
- **เกรดสุขภาพเครื่อง (A–F)** — คำนวณจาก daily stats 30 วัน (หรือ history ถ้ายังไม่มี daily): อุณหภูมิพีค 40 คะแนน + วันพัดลมนิ่ง 30 + EC reliability 30 (รวม 100) · แผงใหม่บน Dashboard แสดงเกรด + คะแนน + พีค + fail · API `/api/daily` ส่ง `health` มาด้วย

## [1.9.6] — 2026-09-17

### Added
- **รีโมตสลับโหมดเรียลไทม์** — ปุ่ม music / ambient / temp บนแผงรีโมตของ Dashboard สั่งผ่าน `POST /api/cmd {"action":"engine","name":...}` → daemon เข้าคิวเดียวกับ hotkey (watcher thread เป็นเจ้าของ EC) · ปุ่มสลับ ▶/■ ตามสถานะจริงทุก refresh
- **Discord webhook** — settings `notifications.discord_webhook` (ช่องกรอกในแผง Notifications ของ GUI): ทุกแจ้งเตือนที่ผ่านเกณฑ์ (EC/พัดลม/ร้อน) ส่งเข้าแชทด้วย · **สรุปรายวันอัตโนมัติ** (เฉลี่ย/พีคอุณหภูมิ, RPM เฉลี่ย, EC fail) ยิงตอนเปลี่ยนวัน · ไม่มี dependency เพิ่ม (plain HTTP), พลาดแล้ว log แทน crash
- **Installer จริง (Inno Setup 6)** — `Build-Installer.bat` สร้าง `dist\ClevoBacklight-Setup-<ver>.exe` (ตรวจ ISCC ทั้ง LocalAppData/Program Files + แนะนำ winget) · แก้ flag `uncheckedonce` ที่ ISCC ปัจจุบันไม่รู้จัก · **สร้างและตรวจแล้ว: `ClevoBacklight-Setup-1.9.5.exe` (35 MB)**

## [1.9.5] — 2026-09-17

### Added
- **รีโมตจากมือถือ/หน้าเว็บ (opt-in)** — เปิด checkbox "อนุญาตให้ควบคุมไฟจากหน้าเว็บ" ในแผง Dashboard แล้วหน้าเว็บจะมีปุ่ม power / brightness 0–3 / โปรไฟล์ทั้งหมด ยิง `POST /api/cmd` ผ่าน daemon (auth token เดิม) · **ปิดโดย default** · สั่ง EC เหมือน hotkey — ไม่แก้ settings ที่เซฟไว้
- **สำรองข้อมูลอัตโนมัติรายวัน** — daemon copy `settings.json` + `history.json` ไป `backups/` วันละ 1 ชุด (ตรวจที่ health tick แรกของวัน) เก็บย้อนหลัง **7 ชุด** แล้ว prune เอง · CLI ใหม่ `clevo_ec.py --list-backups` และ `--restore-backup STAMP` (ไม่ต้องแอดมิน, restore มีผลหลังรีสตาร์ท daemon)
- **สรุปรายสัปดาห์ + ช่วงเวลาที่ร้อนสุด** — จัดกลุ่ม daily stats เป็น ISO week (พีคอุณหภูมิ/RPM, EC fail, **วันที่ร้อนสุด**) + `hot_hour` ชี้ชั่วโมงที่เคยวัดร้อนสุดจาก history · แผงใหม่บน dashboard + API `GET /api/weekly`

## [1.9.4] — 2026-09-17

### Added
- **แผง Notifications ใน GUI** — เปิด/ปิด toast ทุกชนิดได้เอง (เปิดแจ้งเตือน, EC ล่ม, EC กลับมา, พัดลมหยุดหมุน) + เลือกเกณฑ์อุณหภูมิ (75–100°C) — daemon ใช้ค่าใหม่ในรอบ health ถัดไป
- **สรุปรายวัน 30 วันบน Dashboard** — daemon รวม history เป็นสถิติรายวัน (`daily_stats.json`, เก็บ 60 วัน): temp เฉลี่ย/สูงสุด, RPM เฉลี่ย/สูงสุด, จำนวน EC fail, uptime · แผงใหม่วาดกราฟแท่งรายวัน (เขียว/ส้ม/แดงตามพีค) + ตาราง 14 วันล่าสุด + API `GET /api/daily` · วันปัจจุบันอัปเดตสดทุก health tick วันเก่า freeze
- **ประหยัดไฟตามระดับแบต** — settings `battery.low_percent` (0 = ปิด): ถอดปลั๊กแล้วแบตต่ำกว่าเกณฑ์ → หรี่ตาม cap ของ battery saver · ต่ำกว่า **ครึ่งหนึ่งของเกณฑ์** → หรี่เหลือระดับ 1 (critical) · ทรานซิชันทุกครั้งที่ % ข้ามระดับ พร้อมปลั๊กกลับคืนค่าเดิม · ตั้งค่าจากแผง Battery saver ใน GUI

## [1.9.3] — 2026-09-17

### Added
- **กราฟ RPM พัดลมย้อนหลังบน Dashboard** — canvas ใหม่วาด RPM จาก history (แถบแดง = โซน stall) + ชิปสถิติ **ตอนนี้/ต่ำสุด/สูงสุด/เฉลี่ย** + ป้ายเตือน "⚠ พัดลมหยุดหมุน" เมื่อค่าล่าสุดเป็น 0
- **Toast เตือนพัดลมหยุดหมุน** — daemon ยิงแจ้งเตือนเมื่อ RPM = 0 ขณะ CPU ร้อนถึงเกณฑ์ (threshold − 10°) พร้อม **dedup ต่อตอน** และ re-arm เมื่อเย็นลงกว่า threshold − 15° · ปิดได้ด้วย settings `notifications.on_fan_stall` · ตรวจ logic ด้วย unit test ครบทุกเคส
- **Export CSV สองทาง** — ปุ่ม "⬇ ดาวน์โหลด CSV" บน Dashboard (`/api/history.csv`, UTF-8 BOM เปิดใน Excel ได้ทันที, ปิดได้ด้วย `dashboard.serve_history_csv`) และ CLI `clevo_ec.py --export-csv [ไฟล์]` (อ่าน history.json โดยตรง **ไม่ต้องแอดมิน**) — คอลัมน์ครบทั้ง temp/fan/engines/error

### Fixed
- unit test เดิมเขียน `history.json` จริงของโปรเจกต์ทับ (patch เฉพาะ `STATUS_PATH`) — ตอนนี้ patch `HISTORY_PATH` ครบทุก test

## [1.9.2] — 2026-09-17

### Added
- **การ์ดพัดลมบน Dashboard + status.json** — health loop ของ daemon อ่าน RPM/duty ผ่าน `clevo_fan.read_fan_once()` (อ่านอย่างเดียวเหมือนเดิม) แล้วใส่ `fan: {cpu_rpm, gpu_rpm, cpu_duty_pct, gpu_duty_pct}` ในทุก entry ของ status.json/history · dashboard มีการ์ด "พัดลม CPU" (RPM ใหญ่ + duty/GPU รอง) พร้อม fallback กรณีอ่านไม่ได้ · ตารางเหตุการณ์โชว์ RPM ย้อนหลัง · tray tooltip เพิ่ม `FAN nnnn RPM`

## [1.9.1] — 2026-09-17

### Changed
- **Fan module กลายเป็น read-only monitor** — การทดสอบบนฮาร์ดแวร์จริงพิสูจน์ว่า EC เฟิร์มแวร์นี้**สั่งพัดลมผ่าน EC RAM ไม่ได้**: เขียน DUT โดนทับกลับใน ~1 วิ, sticky-writer 4 Hz ทำ duty ค้างใน RAM แต่ RPM นิ่ง (EC ไม่เอาไปขับ PWM), DSDT ไม่มี write path — `clevo_fan.py` เหลือ `status` / `watch` + `set_duty` ถูกถอดออก (raise พร้อมคำอธิบาย), `--fan-duty` ถูกถอดออกจาก CLI, GUI เปลี่ยนแผงเป็น **Fan monitor** (อ่านสถานะ + มอนิเตอร์ 1 Hz ผ่าน worker thread + poller)
- **unit test การันตี no-write** — `test_never_writes` ตรวจว่าทุก code path ของ monitor ไม่เขียน EC RAM แม้ไบต์เดียว (mock RAM จดจับ write ทุกครั้ง)

### Fixed
- **GUI ล้นขอบจอล่าง** (ต่อยอดจาก scroll canvas v1.9) — scrollbar **ซ่อนอัตโนมัติ**เมื่อเนื้อหาสั้นกว่าจอ (ไม่มีแถบว่างขวาค้าง), และ `_fit_window` **clamp ตำแหน่ง Y** หลังจัดขนาดเพื่อกันหน้าต่างยื่นใต้ taskbar

### Verified
- test_all.bat ผ่านครบ (fan monitor suite ใหม่รวม no-write guarantee)

## [1.9.0] — 2026-09-17

### Added
- **Fan control** (`clevo_fan.py`) — อ่าน duty/RPM/โหมด + ตั้ง duty manual ต่อพัดลม (CPU/GPU) จาก EC register ที่ถอดจาก DSDT RAM-mirror (`DUT1/2 @ 0xCE/0xCF`, `RPM1/2 @ 0xD0/0xD2` 16-bit endianness auto-detect, บิตโหมด FAN0/1 @ 0x02) · **safety floor 25%** (ตั้งได้) + บันทึก/คืนค่าบิต auto ของ EC เอง · GUI แผงใหม่ + CLI `clevo_fan.py status|set|auto` และ `clevo_ec.py --fan status|auto --fan-duty cpu=60,gpu=50`
- **ตัวหาเซ็นเซอร์อัตโนมัติ** (`ec_sensor_finder.py`) — สุ่ม EC RAM ทุก address ช่วง idle→load (all-core numpy matmul)→cool แล้วจัดอันดับด้วย Pearson correlation กับ temp อ้างอิง + เทียบ Windows thermal zone · `--save-map` ส่งออกเป็น hardware profile
- **Dashboard บน LAN + auth token** — settings `dashboard`: `bind: loopback|lan` (LAN **ต้องมี token** ไม่งั้น daemon fallback เป็น loopback ให้เอง), `token` (ตรวจผ่าน `?token=` หรือ header `X-Auth-Token`, ไม่ผ่าน = 401) · GUI แผงตั้งค่า + tray เปิดพร้อม token ติด URL
- **Publish prep** — `LICENSE` (MIT + hardware notice), `.gitignore` (runtime state/build output), `CONTRIBUTING.md` (กติกาทดสอบ + วิธีส่ง hardware profile ใหม่)

### Changed
- **แก้แผนที่ GPU temp ตามหลักฐาน DSDT**: GPU = **0xC7 (`VGAT`)** ไม่ใช่ 0x08 — บล็อก mirror ใน DSDT (บรรทัด 27548+) ชี้ว่า 0x08 คือ `AC1` (trip point ที่ ACPI เขียนลงไป) ส่วน mirror ยืนยันถูกต้องเพราะ `TMP@0x07` ตรง thermal zone ที่ verify ไว้ · แก้ `TEMP_REG`, `HW_DEFAULTS`, test และเอกสาร

### Verified
- Offline tests ครบ (เพิ่ม fan controller suite + dashboard token/LAN-fallback + 401 จริง)

## [1.8.0] — 2026-09-17

### Added
- **Live Dashboard** — daemon เปิดเว็บเซิร์ฟเวอร์ที่ `http://127.0.0.1:8787` (localhost เท่านั้น): สถานะ EC/อุณหภูมิ/ไฟ/uptime + เอนจินที่รัน + **กราฟอุณหภูมิย้อนหลัง ~12 ชม.** · เปิดจากเมนู tray "เปิด Dashboard" · API `GET /api/status`
- **status history** — `history.json` เก็บ health samples (RAM ring + disk, รีโหลดตอน daemon เริ่มใหม่ → กราฟไม่หายข้ามการรีสตาร์ท)
- **Toast notifications** — Windows 10/11 toast ผ่าน PowerShell WinRT (ไม่เพิ่ม dependency): EC อ่านไม่ได้ (watchdog เช็กทุก 10 วิ), EC กลับมาปกติ (dedup), CPU ≥ threshold (hysteresis 5°), เอนจินหยุดเอง · ตั้งค่าได้ใน settings `notifications` / GUI
- **Hardware profiles** — settings `hardware.profile` (เริ่มที่ `n957tp6`: CPU=0x07, GPU=0x08 ที่ยืนยันแล้ว) + `temp_reg_override` · `resolve_temp_reg()` เรียงลำดับ override > profile > built-in · GUI dropdown + `--temp --hardware`
- **`--dump-ec` ครบเครื่องมือสำรวจ** — `--label` (แท็ก), `--save-dump` (เก็บ baseline JSON), `--diff` (เทียบก่อน/หลังโหลด ชี้ address ที่ค่าวิ่งตามอุณหภูมิ) — ใช้ได้ทั้ง `clevo_ec.py` และ `clevo_temp.py`
- **Inno Setup installer** — `installer.iss` + `Build-Installer.bat`: ติดตั้ง exe/dashboard/เอกสาร → Program Files, shortcut กลุ่ม+desktop, checkbox สร้าง Scheduled Task autostart, uninstall หยุด task/process + ลบไฟล์ (เก็บ settings ผู้ใช้)
- **RESEARCH.md + docs/research.html** — เอกสารสรุปงานค้นคว้าฉบับเต็ม (ช่องทางที่ตัน, การถอด DSDT, สถาปัตยกรรม, บั๊ก/บทเรียน)

### Fixed
- AST auditor: ข้าม nested class (HTTP handler ในเมธอด) + รู้จัก attrs ของ `BaseHTTPRequestHandler` — ไม่ false-positive กับโค้ดเซิร์ฟเวอร์
- status server: `port 0` คืนค่าพอร์ตจริงจาก `server_address` (ใช้โดย tests)

### Verified
- Offline checks 7/7 ผ่าน (เพิ่ม: hardware/notifications validation, toast escaping, history, **dashboard HTTP handler จริงบน localhost**)
- daemon จริง: `/api/status` ตอบ `ec_ok:true, cpu_temp` + dashboard.html ถูก serve

## [1.7.0] — 2026-09-17

### Added
- **Hotkey สั่งโหมดเรียลไทม์ผ่าน daemon** — `Ctrl+Alt+M` เปิด/ปิดโหมดเพลง, `Ctrl+Alt+A` เปิด/ปิดโหมด Ambient จากที่ไหนก็ได้ (แม้อยู่ในเกม) · ครั้งละหนึ่งเอนจิน — เปิดตัวใหม่ = หยุดตัวเก่าให้เอง · toggle ผ่านคิวด้านใน (hotkey thread ตอบสนองทันที ไม่ปัก EC) · ปรับ sensitivity/mix ของ daemon ได้จากแผง "Engine defaults" ใน GUI หรือ settings `engines` (ไม่ต้องรีสตาร์ท)
- **Health check + status.json** — daemon ตรวจ EC ทุก 60 วิ (ปรับได้ `health_check.interval`): อ่านอุณหภูมิ CPU จาก EC แล้วเขียน `status.json` (`ec_ok`, `cpu_temp`, power, เอนจินที่รัน, uptime) สำหรับเครื่องมือภายนอก + เมนู tray แสดงย่อ "สถานะ: EC OK, CPU °C" + คลิกดู JSON เต็มลง daemon.log
- **GitHub Actions CI** (`.github/workflows/ci.yml`) — รัน test_all.bat บน windows-latest ทุก push/PR, smoke-build exe, และแนบ release zip อัตโนมัติเมื่อ publish release
- **`--dump-ec`** — dump EC RAM 0x00–0xFF ทั้งหมด (hex + ASCII) สำหรับหาเซ็นเซอร์ temp/fan บนเครื่อง Clevo รุ่นอื่น (เทียบค่าก่อน/หลังโหลดหนัก)
- **temp address ตั้งค่าได้** — `engines.temp_reg` ใน settings.json (null = ใช้ 0x07 CPU / 0x08 GPU มาตรฐานของเครื่องนี้) พร้อม `--temp --reg` ทาง CLI, ช่องกรอกใน GUI, validation ยอมรับ hex/decimal 0–255
- `--ambient --interval` (ความถี่จับจอทาง CLI) + CLI จำ `--sensitivity` ลง settings ให้เอง
- `test_config_and_daemon.py` — ชุดทดสอบ offline ใหม่สำหรับ health round-trip, engine lifecycle (เปิดทับ/หยุดซ้ำ/คิวคำสั่ง) และ validation ใหม่ทั้งหมด → test_all.bat กลายเป็น 7 ขั้น

### Fixed
- `engine_start` ใน daemon อ้าง `self.kb` ก่อน connect (AttributeError เมื่อเรียกเอนจินครั้งแรกจาก hotkey) — เปลี่ยนไปใช้ handle จาก `self.connect()`

### Verified
- Offline checks **7/7 ผ่าน** (รวมชุด mixin ใหม่) · AST audit CLEAN
- ทดสอบสดบน daemon จริง (แนะนำ): `Ctrl+Alt+M` ระหว่างเปิดเพลง + ดู `status.json`/เมนู tray

## [1.6.0] — 2026-09-17

### Added
- **Temperature reactive mode** (`clevo_temp.py`) — สีไล่ cyan→เขียว→เหลือง→แดงตามความร้อน CPU/GPU อ่านจาก EC RAM `0x07`/`0x08` โดยตรง, ความสว่างไล่ 35→100%, alarm blink ≥90°C, GUI panel + CLI (`--temp --source`)
- **แหล่งอุณหภูมิยืนยันข้ามแหล่ง** — EC 0x07 = 45°C ตรงกับ Windows `MSAcpi_ThermalZoneTemperature` (45.1°C) → ยืนยัน 0x07=CPU, 0x08=GPU (probe: `ec_probe_monitor_temp.py`)
- **Battery saver** — daemon เช็ก `GetSystemPowerStatus` ทุก 10 วิ: ถอดปลั๊ก = จำกัด brightness/apply โปรไฟล์ประหยัด (ไม่แก้ค่าที่เซฟ), เสียบกลับ = คืนค่าเดิม · GUI panel + settings `battery`
- **จัดการโปรไฟล์ใน GUI** — ปุ่ม "บันทึกค่าปัจจุบัน" (ตั้งชื่อ dialog) และ "ลบโปรไฟล์" ทำครบในหน้าต่างเดียว ไม่ต้องแก้ JSON
- **เว็บเอกสาร** `docs/index.html` — คู่มือฉบับย่อ + ผัง GUI จำลองตามโครงจริง + ตารางสถานะการทดสอบ (self-contained)

### Verified on hardware
- **Monitor resume/hotplug ยืนยันสมบูรณ์**: ยิง `WM_POWERBROADCAST` (PBT_APMRESUMEAUTOMATIC) + `WM_DISPLAYCHANGE` เข้าหน้าต่าง daemon → daemon.log: `resume -> re-apply (debounced)` → `applied settings (resume)` → `applied settings (displaychange)` — พาธ restore หลัง sleep ทำงานจริง
- GUI smoke test: **58 ขั้นตอน PASS 0 failures** (เพิ่ม temp อ่านได้จริง 51°C, battery สองทาง, profile save/delete)
- Offline tests ครบ **6/6** (เพิ่ม temp engine suite)

## [1.5.0] — 2026-09-17

### Added
- **Hardening ชั้น EC 3 ชั้น** — cross-process mutex `Global\ClevoBacklightEC` ครอบทุกธุรกรรม mailbox (GUI/daemon/CLI รันพร้อมกันได้อย่างปลอดภัย), retry ×3 พร้อม backoff เมื่อ EC ช้า, drain OBF กันไบต์ค้างจาก timeout เก่า
- **Single-instance daemon** — global mutex `Global\ClevoBacklightDaemon`: รันซ้ำ/task ยิงซ้ำออกเองเงียบ ๆ
- **Game auto-profile** — daemon ตรวจ foreground .exe ทุก ~5 วิ (OpenProcess + GetModuleBaseNameW, light-weight): เจอเกมในรายการ → สลับโปรไฟล์ทันที ปิดเกม → กลับ `restore_profile` · ตั้งค่าใน GUI แผงใหม่
- **Day schedule** — เปลี่ยนโปรไฟล์ตามเวลา (HH:MM → profile) ข้ามเที่ยงคืนได้ (slot ล็อจิกทดสอบยูนิตครบ) · ตั้งค่าใน GUI แผงใหม่ · ทั้งสองระบบ debounce + อ่าน settings ใหม่ทุก poll ไม่ต้องรีสตาร์ท
- **ติดตั้ง autostart จริงแล้ว** — Scheduled Task `ClevoBacklightDaemon` (ONLOGON, HIGHEST) ชี้ที่ `dist\ClevoBacklight.exe --daemon` และยืนยันว่าทำงาน: apply startup ✅ hotkeys ✅ tray ✅ monitor ✅

### Fixed
- **หน้าต่าง monitor สร้างไม่ได้ตั้งแต่ v1.1** (`CreateWindowExW failed; monitor disabled` ใน daemon.log) — สาเหตุ: `WNDCLASSEX.hInstance` เป็น NULL และ `RegisterClassExW/CreateWindowExW` ไม่มี prototypes (HWND 64-bit โดน truncation) — แก้แล้ว restore หลัง sleep/hotplug ทำงานเต็มสมรรถ

### Verified on hardware
- GUI smoke test: **51 ขั้นตอน PASS 0 failures** (เพิ่มโปรไฟล์ 3 ตัว + automation panel + schedule unit)
- daemon ผ่าน task: startup apply + hotkeys (รวม Ctrl+Alt+P) + tray + monitor ไม่มี error

## [1.4.0] — 2026-09-17

### Added
- **Color profiles** — โปรไฟล์สีตั้งชื่อได้ (`gaming` / `work` / `night` มาให้) สลับได้ 4 ทาง: ปุ่มใน GUI, เมนู tray, hotkey `Ctrl+Alt+P`, CLI `--profile`; ค่าทั้งชุดถูก validate และ sync เข้า settings.json (daemon restore เข้าโปรไฟล์ล่าสุดเอง)
- **Ambient mode** (`clevo_ambient.py`) — ไฟเปลี่ยนสีตามหน้าจอจริงแบบ Ambilight: จับจอด้วย DirectX Desktop Duplication (`mss`) → 3 แถบแนวตั้ง → gamma 1.6 + smoothing → ผสมกับสีที่เซฟตาม Mix 0–1 (ปรับสดใน GUI ได้) — CLI: `clevo_ambient.py` หรือ `clevo_ec.py --ambient`
- **ec_music_test.py** — ทดสอบ realtime บนเครื่องจริง: เล่นโน้ตสังเคราะห์ออกลำโพงจริงแล้ววัดว่า loopback แยก band ถูกโซน (100 Hz → BASS, 3 kHz → TREBLE) + นับ EC writes ของ ambient
- **release.bat** — แพ็ก `dist\ClevoBacklight.exe` + README + CHANGELOG เป็น zip ชื่อเวอร์ชันได้
- Hotkey ใหม่: `Ctrl+Alt+P` วนโปรไฟล์ถัดไป (daemon)

### Fixed
- **บั๊ก shadow ร้ายแรง:** แอตทริบิวต์ `self._stop` (threading.Event) ทับเมธอด `Thread._stop()` ภายในของ Python ทำให้ `join()` พัง (`TypeError: 'Event' object is not callable`) — มีทั้งใน music engine และ ambient engine เปลี่ยนเป็น `_stop_ev` ทั้งคู่ + ตัวตรวจ AST ห้ามชื่อนี้ตลอดไป

### Verified on hardware
- Music end-to-end: 100 Hz → BASS dominant (0.14/0.004/0.001), 3 kHz → TREBLE dominant, 507 EC writes ระหว่างโน้ต
- Ambient: จับสีจอจริงรายแถบ, 705 EC writes ใน 6 วิ, เริ่ม/หยุดสะอาด
- GUI smoke test: 44 ขั้นตอน PASS 0 failures

## [1.3.0] — 2026-09-17

### Added
- **test_all.bat** — ตรวจทุกอย่างในคำสั่งเดียว (compile + AST audit + offline tests ทั้ง 5 ชุด) สำหรับรันก่อน build ทุกครั้ง
- **GUI smoke test** (`clevo_backlight_gui.py --smoke-test`) — อัตโนมัติ: ทดสอบทุกปุ่ม GUI กับ EC จริง (power/brightness/โหมดทั้ง 7/พาเลต 12 สี/สีรายโซน/music) แล้วคืนค่าเดิม → `gui_smoke_test.log`
- **audit_self_attrs.py** — ตรวจ AST หา `self.x` ที่อ้างแต่ไม่มีนิยาม (จับ AttributeError ก่อนรัน)

### Fixed
- **`App._set_status` หาย** (แอตทริบิวต์เรียก 21 จุดแต่ไม่มี def) — GUI พังทันทีตอนเปิด (`AttributeError`) เกิดจากการเขียน GUI ใหม่ทั้งไฟล์ตอนเน็ตหลุด — เพิ่มเมธอดกลับ + สร้างตัวตรวจจากบทเรียนนี้

### Verified on hardware
- โหมดเอฟเฟกต์ทั้ง 7: คำสั่งถูก EC รับหมด ไม่มี error (`ec_mode_test.log`)
- GUI smoke test ครั้งแรก: PASS 0 failures (39 ขั้นตอน)

## [1.2.0] — 2026-09-17

### Added
- **Music reactive mode** (`clevo_music.py`) — ไฟเต้นตามเสียงระบบ: WASAPI loopback → FFT → BASS/MID/TREBLE แยกโซน, adaptive noise floor, beat detector, attack/decay — ปรับ sensitivity สดใน GUI ได้ + CLI (`clevo_ec.py --music`, `clevo_music.py`)
- **แพ็กเป็นไฟล์เดียว** — `ClevoBacklight.exe` (PyInstaller onefile: GUI + daemon + CLI + music + ไดรเวอร์ฝังในตัว) พร้อม `launcher.py` route ตาม flag และ `--selftest`
- GUI ใหม่: music controls (เริ่ม/หยุด, gradient, sensitivity สด, แถบ BASS/MID/TRE real-time), speed slider, palette 12 สี, hotkey editor จับคีย์เอง

### Fixed
- `colors_rgb()` เรียกผิดพารามิเตอร์ใน `run_music` (TypeError เมื่อรัน music โดยไม่ใส่ `--color`)
- stdout wrapper ปิด buffer ร่วมกันตอนรันภายใต้ `pythonw` (แก้ด้วย `detach()`)

## [1.1.0] — 2026-09-16

### Added
- **settings.json** — ค่าคงอยู่ข้ามการรัน + validation กันไฟล์เสีย (`config.py`)
- **Daemon** (`clevo_daemon.py`) — restore อัตโนมัติหลัง boot / sleep / hotplug + **global hotkeys** (RegisterHotKey) + **tray icon** เปลี่ยนสีตามไฟจริง + ปุ่มฉุกเฉิน `Ctrl+Alt+K`
- **Autostart** — `Install-Autostart.bat` / `Remove-Autostart.bat` (Scheduled Task RunLevel=Highest ไม่มี UAC กระโดดทุก logon)
- CLI: `--save` / `--apply-saved` + sync settings.json ทุกคำสั่ง

## [1.0.0] — 2026-09-16

### Added
- **โปรโตคอล EC เต็มรูปแบบ** — ถอดรหัสจาก DSDT ของเครื่องเอง (case `0x67` ของ `SCMD`): mailbox `FCMD/FDAT/FBUF/FBF1/FBF2` ที่ EC RAM `0xF8–0xFC`, คำสั่ง `0xC2/0xC4/0xCA` (เปิด/ปิดไฟ, ความสว่าง 4 ระดับ, สี 3 โซน, เอฟเฟกต์, ความเร็ว)
- **ชั้นเข้าถึง EC** — โหลดไดรเวอร์ WinRing0x64 (ลงนาม v1.2.0.5) on-demand + โปรโตคอล ITE ผ่านพอร์ต 0x62/0x66 พร้อมเช็ก IBF/OBF
- CLI (`clevo_ec.py`) + GUI แรก (tkinter)

### Verified on hardware
- อ่าน EC RAM ได้ทุกตำแหน่ง, FCMD เคลียร์กลับ 0x00 เอง = mailbox มีชีวิต
- สีรายโซน แดง→เขียว→น้ำเงิน, ความสว่าง 4 ระดับ, เปิด/ปิด — ยืนยันด้วยสายตาทั้งหมด

### Why direct EC?
เครื่องนี้ (N957TP6 + dsanke BIOS) ช่องทางมาตรฐานใช้ไม่ได้ทั้งหมด: WMI ไม่ถูกลงทะเบียน (ไม่มี MOF), Control Center ต้องการไดรเวอร์ DCHU ที่ไม่มี, `\\.\ACPI` symlink หายบน build นี้, `GetSystemFirmwareTable` ถูกปิด, คีย์บอร์ดเป็น PS/2 — รายละเอียดใน README
