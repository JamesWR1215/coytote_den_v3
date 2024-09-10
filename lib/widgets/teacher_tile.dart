import 'package:coytote_den_v3/models/teacher.dart';
import 'package:coytote_den_v3/services/boxes.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

SelectionArea teacherTile(Teacher teacher, int index, Function deleteCallback) {
  return SelectionArea(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
      child: ListTile(
        tileColor: teacher.callBack
            ? const Color.fromARGB(255, 224, 218, 240)
            : Colors.white,
        leading: Text(
          'Room ${teacher.roomNumber} \n${teacher.extension}',
          style: const TextStyle(fontSize: 18),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "${teacher.firstName} ${teacher.lastName}",
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              teacher.idNumber.toString(),
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
        trailing: Wrap(
          children: [
            IconButton(
              onPressed: () async {
                final Uri emailUri = Uri(
                  scheme: 'mailto',
                  path: teacher.email,
                );

                try {
                  await launchUrl(emailUri);
                } catch (e) {
                  print(e.toString());
                }
              },
              icon: const Icon(Icons.mail_rounded),
            ),
            Switch(
                value: teacher.callBack,
                onChanged: (newValue) {
                  teacher.callBack = newValue;
                  boxTeachers.putAt(index, teacher);
                  deleteCallback();
                }),
            IconButton(
              onPressed: () {
                boxTeachers.deleteAt(index);
                boxTeachers.compact;
                deleteCallback();
                print('${teacher.firstName}  Deleted');
              },
              icon: const Icon(Icons.delete_outline_sharp),
            ),
          ],
        ),
      ),
    ),
  );
}
