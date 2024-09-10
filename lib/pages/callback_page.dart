import 'package:coytote_den_v3/services/boxes.dart';
import 'package:coytote_den_v3/widgets/appbar.dart';
import 'package:coytote_den_v3/widgets/teacher_tile.dart';
import 'package:flutter/material.dart';

class CallbackPage extends StatefulWidget {
  const CallbackPage({super.key});

  @override
  State<CallbackPage> createState() => _CallbackPageState();
}

class _CallbackPageState extends State<CallbackPage> {
  refreshTeacherList() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Callback Page'),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: boxTeachers.length,
                  itemBuilder: (context, index) {
                    final teacher = boxTeachers.getAt(index);
                    if (teacher.callBack) {
                      // return only students with charger set to true
                      return teacherTile(teacher, index, refreshTeacherList);
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
          child: const Icon(Icons.people),
          onPressed: () {
            // nav to teacher page
            Navigator.pushNamed(context, '/teacherPage');
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
