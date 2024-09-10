import 'package:coytote_den_v3/services/boxes.dart';
import 'package:coytote_den_v3/services/import_csv.dart';
import 'package:coytote_den_v3/widgets/add_student_menu.dart';
import 'package:coytote_den_v3/widgets/add_teacher_menu.dart';
import 'package:coytote_den_v3/widgets/appbar.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'Settings Page'),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {
                    addStudentMenu(context);
                  },
                  child: const Text(
                    'Add Student',
                    style: TextStyle(fontSize: 30),
                  )),
              TextButton(
                  onPressed: () {
                    importStudentCSV(context);
                  },
                  child: const Text(
                    'Import  All Students',
                    style: TextStyle(fontSize: 30),
                  )),
              TextButton(
                  onPressed: () {
                    addTeacherMenu(context);
                  },
                  child: const Text(
                    'Add Teacher',
                    style: TextStyle(fontSize: 30),
                  )),
              TextButton(
                  onPressed: () {
                    importStaffCSV(context);
                  },
                  child: const Text(
                    'Import  All Teachers',
                    style: TextStyle(fontSize: 30),
                  )),
              const TextButton(
                  onPressed: clearStudents,
                  child: Text(
                    'Delete All Students',
                    style: TextStyle(fontSize: 30),
                  )),
              const TextButton(
                  onPressed: clearStaff,
                  child: Text(
                    'Delete Teachers',
                    style: TextStyle(fontSize: 30),
                  )),
            ],
          ),
        ));
  }
}
