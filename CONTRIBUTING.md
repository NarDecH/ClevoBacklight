# Contributing to Clevo Backlight Controller

ขอบคุณที่สนใจ! โปรเจกต์นี้พูดคุยกับ Embedded Controller ของเครื่องจริง — จึงมีกติกาดูแลเป็นพิเศษ

## ก่อนเปิด PR

1. **รันชุดตรวจให้ผ่านก่อนเสมอ** (ไม่ต้อง admin):
   ```
   test_all.bat        (Windows)  — compile + AST audit + offline tests ทั้งหมด
   ```
2. โค้ดที่แตะ EC ต้องมี **offline test** ครอบ (mock EC ตามแบบใน `test_clevo_ec_offline.py`)
3. อย่า hardcode address/คำสั่งใหม่โดยไม่มีหลักฐาน — อ้างจาก DSDT ของเครื่อง (ดู `RESEARCH.md`) หรือผล `--dump-ec --diff`
4. อธิบาย "ทำไม" ใน PR description พร้อมผลทดสอบบนเครื่องจริง (รุ่นไหนก็ได้ ระบุ model + BIOS)

## โครงสร้างไฟล์ (แบบแนวราบ — ตั้งใจ)

ไฟล์ `.py` อยู่รากโปรเจกต์ทั้งหมด เพราะ:
- PyInstaller spec ชี้ `launcher.py` ตรง ๆ และ `config.app_base()` อ้างตำแหน่งไฟล์จริง
- daemon/GUI/CLI ใช้ runtime files (settings.json, status.json) ข้างตัวเอง
- ย้ายเข้า `src/` ได้ แต่ต้องแก้ spec, `sys.path` ใน config และ path ของ dashboard ให้ครบ — ถ้าทำ ให้ทำเป็น PR แยก

## กติกาด้านความปลอดภัย

- ห้ามเพิ่มการเขียน EC ที่ไม่มี **floor/safety** (ดูตัวอย่าง `clevo_fan.MIN_DUTY_PCT`)
- ค่าเริ่มต้นทุกอย่างต้องปลอดภัย (loopback, auto fan, notifications เปิด)
- ไม่รับโค้ดที่ปิด signature check หรือโหลดไดรเวอร์ที่ไม่ลงนาม

## เพิ่มรุ่นเครื่องใหม่ (hardware profile)

1. รัน `python ec_sensor_finder.py --save-map mymodel.json` บนเครื่องนั้น (admin)
2. เปิด PR แก้ `clevo_temp.HW_DEFAULTS` พร้อมแนบผล correlation ใน PR description
3. ระบุรุ่น/BIOS และค่าที่ยืนยัน (เช่น "TMP@0x07 == thermal zone 45.1°C")

## สไตล์

- Python 3.12+, stdlib ก่อนเสมอ, comment อธิบาย "ทำไม" เป็นภาษาอังกฤษ, UI เป็นภาษาไทย
- ทุกฟีเจอร์ใหม่ต้องผ่าน `audit_self_attrs.py` (จับ AttributeError ก่อนรัน)
