import 'package:coytote_den_v3/services/boxes.dart';
import 'package:coytote_den_v3/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:coytote_den_v3/widgets/student_tile.dart';

class ChargerPage extends StatefulWidget {
  const ChargerPage({super.key});

  @override
  State<ChargerPage> createState() => _ChargerPageState();
}

class _ChargerPageState extends State<ChargerPage> {
  refreshStudentList() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Charger Page',
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: boxStudents.length,
                  itemBuilder: (context, index) {
                    final student = boxStudents.getAt(index);
                    if (student.charger) {
                      // return only students with charger set to true
                      return studentTile(student, index, refreshStudentList);
                      // Return an empty container for students without chargers
                    } else {
                      return Container();
                    }
                  }),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.person),
          onPressed: () {
            // nav to student page
            Navigator.pushNamed(context, '/studentPage');
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
