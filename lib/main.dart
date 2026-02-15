import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: MainPage(),
    );
  }
}

// 1. ออกแบบคลาสข้อมูลตามข้อกำหนด
class Course {
  final String code;
  final String name;

  Course({required this.code, required this.name});
}

class SemesterRegistration {
  final String term;
  final List<Course> courses;

  SemesterRegistration({required this.term, required this.courses});
}

class Student {
  final String firstName;
  final String lastName;
  final String studentId;
  final String major;
  final String school;
  final String imageUrl;
  final List<SemesterRegistration> registrations;

  Student({
    required this.firstName,
    required this.lastName,
    required this.studentId,
    required this.major,
    required this.school,
    required this.imageUrl,
    required this.registrations,
  });
}

// 2. หน้าที่ 1 (Main Page)
class MainPage extends StatelessWidget {
  // ข้อมูลทดสอบ (mock data)
  final Student student = Student(
    firstName: 'ณัฐภัทร',
    lastName: 'พรมมล',
    studentId: '66103540',
    major: 'สารสนเทศศาสตร์',
    school: 'วิชาเทคโนโลยีสารสนเทศและนวัตกรรมดิจิทัล',
    imageUrl: 'https://scontent.fbkk5-8.fna.fbcdn.net/v/t39.30808-6/469442567_1298975678193127_4682039975611629726_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=106&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeEaFCuIhG6CHxRopX-L9Ik2HxQhOeLgCb8fFCE54uAJv79DjRX8_ZBZMTZ11p86ZArv9DpkCKbHdNV7g8Bavjsc&_nc_ohc=mS0_4RdC4rAQ7kNvwEX4V2H&_nc_oc=Adm39tsoo0Nz8LxrFep7ogRVcFhxnBrhIWfz7U4xvOurLnGWfMdC1csv4i1nVcS6mUQ&_nc_zt=23&_nc_ht=scontent.fbkk5-8.fna&_nc_gid=W2s9kgKb7qgDDJU7uTNp0Q&oh=00_AfarZqhh6nLW5ldlh2UqYoKnI7pvgnNvotxH1tNPwY97vA&oe=68DE160D',
    registrations: [
      SemesterRegistration(
        term: 'ภาคต้น 2567',
        courses: [
          Course(code: 'CS101', name: 'การเขียนโปรแกรมเบื้องต้น'),
          Course(code: 'CS102', name: 'โครงสร้างข้อมูล'),
          Course(code: 'MA101', name: 'คณิตศาสตร์ดิสครีต'),
        ],
      ),
      SemesterRegistration(
        term: 'ภาคปลาย 2567',
        courses: [
          Course(code: 'CS201', name: 'การเขียนโปรแกรมขั้นสูง'),
          Course(code: 'CS202', name: 'ฐานข้อมูล'),
          Course(code: 'EN201', name: 'ภาษาอังกฤษเพื่อการสื่อสาร'),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ข้อมูลนักศึกษา'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // แสดงข้อมูลนักศึกษา
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(student.imageUrl),
              radius: 25,
            ),
            title: Text('${student.firstName} ${student.lastName}'),
            subtitle: Text('รหัสนักศึกษา: ${student.studentId}'),
          ),
          ListTile(
            title: Text('สาขา'),
            subtitle: Text(student.major),
          ),
          ListTile(
            title: Text('สำนักวิชา'),
            subtitle: Text(student.school),
          ),
          Divider(),
          // แถวสุดท้าย: นำทางไปหน้ารายวิชา
          ListTile(
            title: Text('ดูรายวิชาที่ลงทะเบียน'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RegistrationPage(student: student),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// 3. หน้าที่ 2 (Registration Page)
class RegistrationPage extends StatelessWidget {
  final Student student;

  const RegistrationPage({Key? key, required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('รายวิชาที่ลงทะเบียน'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // แสดงข้อมูลนักศึกษาสั้นๆ
          Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(student.imageUrl),
                    radius: 30,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${student.firstName} ${student.lastName}',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text('รหัส: ${student.studentId}'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          // แสดงรายวิชาแยกตามภาคการศึกษา
          ...student.registrations.map((registration) {
            return ExpansionTile(
              title: Text(
                registration.term,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Text('${registration.courses.length} วิชา'),
              children: registration.courses.map((course) {
                return ListTile(
                  contentPadding: EdgeInsets.only(left: 32.0, right: 16.0),
                  title: Text('${course.code} – ${course.name}'),
                );
              }).toList(),
            );
          }).toList(),
        ],
      ),
    );
  }
}