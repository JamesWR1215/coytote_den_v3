import 'package:coytote_den_v3/services/boxes.dart';
import 'package:coytote_den_v3/services/search_help.dart';
import 'package:coytote_den_v3/widgets/teacher_tile.dart';
import 'package:flutter/material.dart';

Expanded teacherListView(String searchText, Function deleteCallback) {
  final filteredTeachers = boxTeachers.values
      .where((teacher) => SearchHelper.staffMatchesSearch(teacher, searchText))
      .toList();

  return Expanded(
    child: ListView.builder(
        itemCount: filteredTeachers.length,
        itemBuilder: (context, index) {
          final teacher = filteredTeachers[index];
          return teacherTile(teacher, index, deleteCallback);
        }),
  );
}
