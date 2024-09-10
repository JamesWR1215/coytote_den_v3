import 'dart:convert';
import 'dart:io';
import 'package:coytote_den_v3/models/student.dart';
import 'package:coytote_den_v3/models/teacher.dart';
import 'package:coytote_den_v3/services/boxes.dart';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

Future<void> importStudentCSV(BuildContext context) async {
  String? filePath;
  final result = await FilePicker.platform.pickFiles(
    allowMultiple: false, // Allow only single file selection
  );

  if (result != null) {
    filePath = result.files.first.path!;

    final input = File(filePath).openRead();
    final fields = await input
        .transform(utf8.decoder)
        .transform(const CsvToListConverter())
        .toList();

    for (List<dynamic> row in fields) {
      String firstName = row[1];
      String lastName = row[0];
      String idNumber = row[2].toString();
      String grade = row[3].toString();

      Student student = Student(
        firstName: firstName,
        lastName: lastName,
        grade: grade,
        id: idNumber,
      );

      boxStudents.put('key_$idNumber', student);
    }
  } else {}
}

Future<void> importStaffCSV(
  BuildContext context,
) async {
  String? filePath;
  final result = await FilePicker.platform.pickFiles(
    allowMultiple: false, // Allow only single file selection
  );

  if (result != null) {
    filePath = result.files.first.path!;

    final input = File(filePath).openRead();
    final fields = await input
        .transform(utf8.decoder)
        .transform(const CsvToListConverter())
        .toList();

    for (List<dynamic> row in fields) {
      String firstName = row[3];
      String lastName = row[2];
      String idNumber = row[0].toString();
      String room = row[4];
      String email = row[1];
      String title = row[5];
      String ext = row[6].toString();

      Teacher teacher = Teacher(
        firstName: firstName,
        lastName: lastName,
        idNumber: idNumber,
        roomNumber: room,
        extension: ext,
        title: title,
        email: email,
      );

      boxTeachers.put('key_$idNumber', teacher);
    }
  } else {}
}
