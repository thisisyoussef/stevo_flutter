import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stevo_flutter/services/topic.dart';

import '../../../models/topic.dart';
import '../../buttons/customButton.dart';

//A dialog box that allows the user to create a new topic
//Similar to the createAssessmentDialog
//Fills in information in the Topic model

class CreateTopicDialog extends StatefulWidget {
  CreateTopicDialog({Key? key}) : super(key: key);

  @override
  _CreateTopicDialogState createState() => _CreateTopicDialogState();
}

//State for the CreateTopicDialog

class _CreateTopicDialogState extends State<CreateTopicDialog> {
  //Text editing controllers for the text fields
  final TextEditingController _topicNameController = TextEditingController();
  final TextEditingController _topicDescriptionController =
      TextEditingController();

  //Key for the form
  final _formKey = GlobalKey<FormState>();

  //new Topic object
  Topic _newTopic = Topic.empty();

  //Function to validate the form
  bool _validateForm() {
    if (_formKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  //Function to clear the text fields
  void _clearTextFields() {
    _topicNameController.clear();
    _topicDescriptionController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Create Topic"),
      content: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.3,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    _newTopic.name = value;
                    print("Topic name changed to ${_newTopic.name}");
                  });
                },
                controller: _topicNameController,
                decoration: InputDecoration(
                  labelText: "Topic Name",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a topic name";
                  }
                  return null;
                },
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    _newTopic.description = value;
                  });
                },
                controller: _topicDescriptionController,
                decoration: InputDecoration(
                  labelText: "Topic Description",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a topic description";
                  }
                  return null;
                },
              ),
              //A dropdown menu for the subject:
              DropdownButtonFormField(
                onSaved: (value) {
                  setState(() {
                    _newTopic.subject = value;
                    print("Subject changed to ${_newTopic.subject}");
                  });
                },
                decoration: InputDecoration(
                  labelText: "Subject",
                ),
                items: [
                  DropdownMenuItem(
                    child: Text("Math"),
                    value: "Math",
                    onTap: () {
                      //SAVE THE dropdownbuttonformfield:
                      _formKey.currentState!.save();
                    },
                  ),
                  DropdownMenuItem(
                    child: Text("Science"),
                    value: "Science",
                  ),
                  DropdownMenuItem(
                    child: Text("English"),
                    value: "English",
                  ),
                  DropdownMenuItem(
                    child: Text("History"),
                    value: "History",
                  ),
                  DropdownMenuItem(
                    child: Text("Other"),
                    value: "Other",
                  ),
                ],
                onChanged: (value) {
                  print("Subject changed to $value");
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomButton(
              text: "Cancel",
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icons.cancel,
            ),
            CustomButton(
              text: "Create",
              onPressed: () async {
                print("Create button pressed");
                if (_validateForm()) {
                  if (await createTopic(_newTopic)) {
                    print("Topic created successfully");
                    _clearTextFields();
                    Navigator.of(context).pop();
                  } else {
                    print("Topic creation failed");
                    //Set error message:
                  }
                } else {
                  print("Form validation failed");
                }
              },
              icon: Icons.add,
            ),
          ],
        ),
      ],
    );
  }
}
