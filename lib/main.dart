import 'package:coytote_den_v3/models/student.dart';
import 'package:coytote_den_v3/models/teacher.dart';
import 'package:coytote_den_v3/pages/callback_page.dart';
import 'package:coytote_den_v3/pages/charger_page.dart';
import 'package:coytote_den_v3/pages/settings_page.dart';
import 'package:coytote_den_v3/pages/student_page.dart';
import 'package:coytote_den_v3/pages/teacher_page.dart';
import 'package:coytote_den_v3/services/boxes.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  //Initializes Hive with a valid directory in your app files,You can also provide a subdirectory
  await Hive.initFlutter();

  Hive.registerAdapter(StudentAdapter()); //register student adapter
  boxStudents = await Hive.openBox<Student>(
    'studentBox',
  ); // opens student box to manipulate data

  Hive.registerAdapter(TeacherAdapter()); //register teacher adapter
  boxTeachers = await Hive.openBox<Teacher>(
    'teacherBox', // opens teacher box to manipulate data
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const StudentPage(),
      routes: {
        '/studentPage': (context) => const StudentPage(),
        '/teacherPage': (context) => const TeacherPage(),
        '/settingsPage': (context) => const SettingsPage(),
        '/chargerPage': (context) => const ChargerPage(),
        '/callbackPage': (context) => const CallbackPage(),
      },
    );
  }
}

//
