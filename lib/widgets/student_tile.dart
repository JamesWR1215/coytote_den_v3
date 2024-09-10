import 'package:coytote_den_v3/models/student.dart';
import 'package:coytote_den_v3/services/boxes.dart';
import 'package:flutter/material.dart';

SelectionArea studentTile(Student student, int index, Function deleteCallback) {
  return SelectionArea(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
      child: ListTile(
        leading: Text(student.grade.toString()), //grade on left of tile
        tileColor: student.charger
            ? const Color.fromARGB(255, 227, 219, 237)
            : Colors.white, //Set tile color based on charger status
        title: Text('${student.firstName} ${student.lastName}'), // full name
        subtitle: Text(student.id.toString()), // ID number under
        trailing: Wrap(
          children: [
            Switch(
              //switch that toggles status of charger
              value: student
                  .charger, // Set the initial switch value based on charger status
              onChanged: (newValue) {
                // Toggle charger status when the switch is changed
                student.charger = newValue;
                boxStudents.putAt(index, student);
                deleteCallback();
              },
            ),
            IconButton(
                onPressed: () {
                  // Delete button to remove the student from the list
                  boxStudents.deleteAt(index);
                  boxStudents.compact;
                  deleteCallback();
                },
                icon: const Icon(Icons.delete))
          ],
        ),
      ),
    ),
  );
}
