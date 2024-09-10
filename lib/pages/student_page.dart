import 'package:coytote_den_v3/services/boxes.dart';
import 'package:coytote_den_v3/widgets/appbar.dart';
import 'package:coytote_den_v3/widgets/search_widget.dart';
import 'package:coytote_den_v3/widgets/studentListView.dart';
import 'package:flutter/material.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  refreshStudentList() {
    setState(() {});
  }

  String query = ''; //init empty search query

  Widget buildSearch() => SearchWidget(
        // search bar that takes name or ID number as input for a search query
        text: query,
        hintText: 'Name or ID#',
        onChanged: searchStudent,
      );

  void searchStudent(String searchText) {
    // Update the search query when input is changed
    setState(() {
      query = searchText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Student Page',
      ),
      body: Center(
        child: Column(
          children: [
            buildSearch(),
            studentListView(refreshStudentList, query),
            Text(boxStudents.length.toString()),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
              child: const Icon(Icons.outlet),
              onPressed: () {
                // nav to charger page
                Navigator.pushNamed(context, '/chargerPage');
              }),
          FloatingActionButton(
              child: const Icon(Icons.people),
              onPressed: () {
                // nav to teacher page
                Navigator.pushNamed(context, '/teacherPage');
              }),
        ],
      ),
    );
  }
}
