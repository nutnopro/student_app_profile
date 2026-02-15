# Student App

คำอธิบายสั้น ๆ
- โปรเจคนี้เป็นแอป Flutter ชื่อ Student App ใช้สำหรับตัวอย่าง/ฝึกเขียน UI และการจัดการแพ็กเกจ

Prerequisites (สิ่งที่ต้องเตรียม)
- ติดตั้ง Flutter SDK (รวม Dart) และตั้ง PATH ให้เรียบร้อย
- ตรวจสอบเวอร์ชัน Dart ที่ต้องการ: `sdk: ^3.9.2` (กำหนดใน `pubspec.yaml`)

ไลบรารี่ (Dependencies) ที่ต้องติดตั้ง (ตาม `pubspec.yaml`)
1. `flutter` (SDK) - หลักของโปรเจค
2. `cupertino_icons: ^1.0.8` - ไอคอนสไตล์ iOS

Dev dependencies (สำหรับพัฒนา / ทดสอบ)
- `flutter_test` (SDK)
- `flutter_lints: ^5.0.0`

คำสั่งติดตั้งไลบรารี่ (เรียงตามลำดับที่ควรทำ)
1. เปิดเทอร์มินัลที่โฟลเดอร์โปรเจค (root ของโปรเจค)

```bash
flutter pub get
```

2. (ถ้าต้องการอัปเดตเป็นเวอร์ชันล่าสุด) อัปเกรดแพ็กเกจ

```bash
flutter pub upgrade --major-versions
```

3. เพิ่มแพ็กเกจใหม่แบบรายตัว

```bash
flutter pub add <package_name>
```

คำสั่งตรวจสอบ / รัน / สร้าง
- ตรวจสอบรายการแพ็กเกจทั้งหมด:

```bash
flutter pub deps
```

- รันแอปบนอุปกรณ์ที่เชื่อมต่อ (หรือเลือก device):

```bash
flutter run
# หรือ ระบุ device เช่น
flutter run -d windows
flutter run -d chrome
```

- รันทดสอบ:

```bash
flutter test
```

- สร้างไฟล์สำหรับปล่อยใช้งาน (ตัวอย่าง Android APK):

```bash
flutter build apk --release
```

หมายเหตุและคำแนะนำสั้น ๆ
- ไฟล์ `pubspec.yaml` ในโครงการกำหนด dependencies หลักไว้แล้ว หากต้องการเพิ่มหรือลบ ให้แก้ `pubspec.yaml` หรือใช้คำสั่ง `flutter pub add` / `flutter pub remove` แล้วรัน `flutter pub get` อีกครั้ง
- หากยังไม่ได้ติดตั้ง Flutter SDK ให้ดูวิธีติดตั้งที่: https://flutter.dev/docs/get-started/install

ไฟล์ที่แก้/สร้าง
- เพิ่ม/แก้ไฟล์ README: [README.md](README.md)

ถ้าต้องการ ผมสามารถ:
- สรุปรายการ dependency เป็นตารางหรือไฟล์แยก
- รัน `flutter pub get` และยืนยันว่าไม่มี error (ถ้าต้องการให้ผมรัน)
# student_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
