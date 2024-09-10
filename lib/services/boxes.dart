import 'package:hive/hive.dart';

late Box boxStudents;
late Box boxTeachers;

void deleteStudent(int index) {
  boxStudents.deleteAt(index);
}

void clearStudents() {
  boxStudents.clear();
}

void deleteStaff(int index) {
  boxTeachers.deleteAt(index);
}

void clearStaff() {
  boxTeachers.clear();
}
