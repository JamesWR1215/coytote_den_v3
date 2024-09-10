import 'package:coytote_den_v3/models/teacher.dart';
import 'package:coytote_den_v3/services/boxes.dart';
import 'package:flutter/material.dart';

void addTeacherMenu(BuildContext context) {
  final formKey = GlobalKey<FormState>(); // Add a form key for validation
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController roomNumControlelr = TextEditingController();
  final TextEditingController idNumberController = TextEditingController();
  final TextEditingController extController = TextEditingController();
  final TextEditingController titleController = TextEditingController();

  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(5.0),
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
              const SizedBox(height: 16),
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
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Room #'),
                controller: roomNumControlelr,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid grade';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
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
              TextFormField(
                decoration: const InputDecoration(labelText: 'Phone ext'),
                controller: extController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an ext';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Title/Position'),
                controller: titleController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid title ';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    // Form fields are valid, create a new student and add to CSV

                    boxTeachers.put(
                        'key_${int.parse(idNumberController.text)}',
                        Teacher(
                          firstName: firstNameController.text,
                          lastName: lastNameController.text,
                          idNumber: idNumberController.text,
                          roomNumber: roomNumControlelr.text,
                          extension: extController.text,
                          title: titleController.text,
                          email:
                              "${firstNameController.text}.${lastNameController.text}@ocps.net",
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
