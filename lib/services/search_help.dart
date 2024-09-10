import 'package:coytote_den_v3/models/student.dart';
import 'package:coytote_den_v3/models/teacher.dart';

class SearchHelper {
  static bool studentMatchesSearch(Student student, String query) {
    // takes student and search query as arguement
    final lowerQuery = query.toLowerCase();
    final fullName = '${student.firstName} ${student.lastName}'.toLowerCase();
    final idNumber = student.id.toString();
    //compares student name or ID number to query
    return fullName.contains(lowerQuery) || idNumber.contains(lowerQuery);
  }

  static bool staffMatchesSearch(Teacher teacher, String query) {
    // takes staff and search query as arguement
    final lowerQuery = query.toLowerCase();
    final fullName = '${teacher.firstName} ${teacher.lastName}'.toLowerCase();
    final idNumber = teacher.idNumber.toString();
    //compares student name or ID number to query
    return fullName.contains(lowerQuery) || idNumber.contains(lowerQuery);
  }
}
