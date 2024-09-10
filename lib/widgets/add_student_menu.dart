import 'package:coytote_den_v3/models/student.dart';
import 'package:coytote_den_v3/services/boxes.dart';
import 'package:flutter/material.dart';

void addStudentMenu(BuildContext context) {
  final formKey = GlobalKey<FormState>(); // Add a form key for validation
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController gradeController = TextEditingController();
  final TextEditingController idNumberController = TextEditingController();

  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'First Name'),
                controller: firstNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid first name';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Last Name'),
                controller: lastNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid last name';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Grade'),
                controller: gradeController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid grade';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'ID Number'),
                controller: idNumberController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid ID number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    // Form fields are valid, create a new student and add to CSV

                    boxStudents.put(
                        'key_${int.parse(idNumberController.text)}',
                        Student(
                          firstName: firstNameController.text,
                          lastName: lastNameController.text,
                          id: idNumberController.text,
                          grade: gradeController.text,
                        ));
                    Navigator.pop(context);
                    // Close the bottom sheet
                  }
                },
                child: const Text('Submit'),
              )
            ],
          ),
        ),
      );
    },
  );
}
