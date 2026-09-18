# SECURITY.md — ความปลอดภัยของ Dashboard / Remote Control

> โมเดลความเสี่ยงของโปรเจกต์นี้: daemon คุมฮาร์ดแวร์จริง (EC ของเครื่อง) ผ่านไดรเวอร์ port-I/O —
> เป้าหมายคือให้**เจ้าของเครื่อง**คุมไฟคีย์บอร์ดได้จากทุกอุปกรณ์ในบ้าน แต่**คนนอกไม่มีทางสั่งได้แม้แต่บิตเดียว**

## ชั้นป้องกัน (โดยลำดับที่ request ต้องผ่าน)

| ชั้น | กลไก | รายละเอียด |
|---|---|---|
| 1. การมองเห็น | `dashboard.bind` | default = **loopback เท่านั้น** (`127.0.0.1`) ไม่มีอะไรออกนอกเครื่องจนกว่าเจ้าของจะเปิด `bind: lan` เอง |
| 2. fallback ปลอดภัย | LAN ต้องมี token | เปิด LAN โดยไม่ตั้ง token → daemon **ตัดสิทธิ์ตัวเองกลับไป loopback อัตโนมัติ** (พิสูจน์ด้วย unit test) |
| 3. authentication | token | ทุก request (GET/POST/หน้าเว็บ) ตรวจ `?token=` หรือ header `X-Auth-Token` — ไม่ผ่าน = 401 |
| 4. rate limit + block | **AuthGuard** (v1.9.12) | ยิง token ผิด **5 ครั้งใน 60 วิ = บล็อก IP นั้น 300 วิ** (ตอบ 429 แม้ token ถูกมาทีหลัง) · ทุกความพยายาม log IP ลง `events.jsonl` (`auth_fail`) · toast + Discord/Telegram แจ้งเจ้าของ (dedup 10 นาที) |
| 5. authorization ซ้อน | `allow_control` (default **ปิด**) | แม้ผ่าน token มา — การ**เขียน** (คุมไฟ/สลับโหมด/แก้โปรไฟล์/ตั้งค่าแจ้งเตือน) ต้องเปิด `allow_control` ใน GUI ก่อน ไม่งั้น 403 · อ่านสถานะอย่างเดียวไม่ต้อง |
| 6. input validation | ทุก POST | JSON parse + ตรวจค่าก่อนใช้เสมอ — action ไม่รู้จัก = 400, โปรไฟล์ผิดรูป (สี/mode/ความยาวชื่อ) = 400 ผ่าน `config.upsert_profile` |
| 7. firewall boundary | Windows Firewall | ปุ่มใน GUI สร้าง rule เฉพาะ **profile Private** (TCP 8787 inbound) — network สาธารณะ (Wi-Fi คาเฟ่ ฯลฯ) ยังปิดอยู่ |

## Threat model (สั้น)

| ผู้กระทำ | สิ่งที่พยายาม | ผล |
|---|---|---|
| เพื่อนบ้านใน Wi-Fi เดียวกัน | เปิดหน้า dashboard | ต้องมี token — เดาผิด 5 ครั้ง = โดนบล็อก + เจ้าของได้รับแจ้ง |
| เครือข่ายสาธารณะ | สแกนพอร์ต 8787 | firewall rule เฉพาะ Private → มองไม่เห็นพอร์ตเลย |
| malware บนเครื่องเดียวกัน | ยิง localhost API | token + allow_control ยังกั้นการเขียน (แต่ malware ระดับนี้อ่าน EC เองได้อยู่แล้ว — อยู่นอกขอบเขต) |
| คนที่ได้ token ไป | สั่งไฟ | ทำได้เฉพาะสิ่งที่โปรแกรมนี้ทำได้ (ไฟคีย์บอร์ด) — token หมุนได้ทุกเมื่อจาก GUI |

**ขอบเขตที่ยอมรับ:** ผู้โจมตีที่รันโค้ดในเครื่องด้วยสิทธิ์ admin ชนะเสมอ (โหลดไดรเวอร์ EC เองได้) — ระบบนี้ออกแบบเพื่อกัน**ผู้ไม่หวังดีจากเครือข่าย** ไม่ใช่กัน admin ของเครื่องตัวเอง

## การใช้งานที่แนะนำ

- เปิด LAN เมื่อใช้จริงเท่านั้น · ตั้ง token ยาว ๆ (GUI สร้างให้แบบสุ่ม 16 hex)
- QR ในแผง Mobile access มี token ฝัง — อย่าถ่ายหน้าจอไปแชร์
- ถ้าสงสัยว่า token หลุด: เปลี่ยนใน GUI → รีสตาร์ท daemon (token เก่าใช้ไม่ได้ทันที)
- ตรวจความพยายามบุกรุกย้อนหลัง: Events viewer บน dashboard (filter `auth_fail`) หรือ `events.jsonl`

## การทดสอบที่พิสูจน์

- `test_auth_guard.py` — limit/block/expiry + HTTP wiring (401 → 429 → events) + notify dedup
- `test_config_and_daemon.py` — token gate 401, LAN-without-token fallback, allow_control 403, validation 400 ของ `/api/profiles`
- `smoke_test.py` — auth pair (401 ไม่มี token / 200 มี token) ทุกครั้งหลัง deploy
