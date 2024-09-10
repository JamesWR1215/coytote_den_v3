import 'package:coytote_den_v3/services/boxes.dart';
import 'package:coytote_den_v3/services/search_help.dart';
import 'package:coytote_den_v3/widgets/student_tile.dart';
import 'package:flutter/material.dart';

Expanded studentListView(Function deleteCallback, String searchText) {
  final filteredStudents = boxStudents.values
      .where(
          (student) => SearchHelper.studentMatchesSearch(student, searchText))
      .toList();

  return Expanded(
    child: ListView.builder(
        itemCount: filteredStudents.length,
        itemBuilder: (context, index) {
          final student = filteredStudents[index];
          return studentTile(student, index, deleteCallback);
        }),
  );
}
