import 'package:coytote_den_v3/services/boxes.dart';
import 'package:coytote_den_v3/widgets/appbar.dart';
import 'package:coytote_den_v3/widgets/search_widget.dart';
import 'package:coytote_den_v3/widgets/teacher_list_view.dart';
import 'package:flutter/material.dart';

class TeacherPage extends StatefulWidget {
  const TeacherPage({super.key});

  @override
  State<TeacherPage> createState() => _TeacherPageState();
}

class _TeacherPageState extends State<TeacherPage> {
  void refreshTeacherList() {
    setState(() {});
  }

  String query = ' '; //init empty search query

  Widget buildSearch() => SearchWidget(
        // search bar that takes name or ID number as input for a search query
        text: query,
        hintText: 'Name or ID#',
        onChanged: searchStaff,
      );

  void searchStaff(String searchText) {
    // Update the search query when input is changed
    setState(() {
      query = searchText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Teacher Page',
      ),
      body: Center(
        child: Column(
          children: [
            buildSearch(),
            teacherListView(query, refreshTeacherList),
            Text(boxTeachers.length.toString()),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
              child: const Icon(Icons.phone),
              onPressed: () {
                // nav to charger page
                Navigator.pushNamed(context, '/callbackPage');
              }),
          FloatingActionButton(
              child: const Icon(Icons.person),
              onPressed: () {
                // nav to teacher page
                Navigator.pushNamed(context, '/studentPage');
              }),
        ],
      ),
    );
  }
}
