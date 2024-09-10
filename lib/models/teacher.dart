import 'package:hive/hive.dart';
part 'teacher.g.dart';

@HiveType(typeId: 2)
class Teacher extends HiveObject {
  @HiveField(0)
  final String firstName;

  @HiveField(1)
  final String lastName;

  @HiveField(2)
  final String idNumber;

  @HiveField(3)
  final String roomNumber;

  @HiveField(4)
  final String extension;

  @HiveField(5)
  final String title;

  @HiveField(6)
  final String email;

  @HiveField(7)
  bool callBack;

  Teacher({
    required this.firstName,
    required this.lastName,
    required this.idNumber,
    required this.roomNumber,
    required this.extension,
    required this.title,
    required this.email,
    this.callBack = false,
  });
}
