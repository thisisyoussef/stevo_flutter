import 'package:flutter/material.dart';
import 'package:stevo_flutter/services/topic.dart';

import '../../../data/constants.dart';
import '../../../models/topic.dart';
import '../../buttons/customButton.dart';

class CreateTopicDialog extends StatefulWidget {
  CreateTopicDialog({Key? key}) : super(key: key);

  @override
  _CreateTopicDialogState createState() => _CreateTopicDialogState();
}

class _CreateTopicDialogState extends State<CreateTopicDialog> {
  final TextEditingController _topicNameController = TextEditingController();
  final TextEditingController _topicDescriptionController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Topic _newTopic = Topic.empty();

  bool _validateForm() {
    if (_formKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  void _clearTextFields() {
    _topicNameController.clear();
    _topicDescriptionController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Create Topic",
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.3,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Topic Name",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    _newTopic.name = value;
                  });
                },
                controller: _topicNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter topic name",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a topic name";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              Text(
                "Topic Description",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    _newTopic.description = value;
                  });
                },
                controller: _topicDescriptionController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter topic description",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a topic description";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              Text(
                "Subject",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Select subject",
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                onSaved: (value) {
                  setState(() {
                    _newTopic.subject = value;
                  });
                },
                items: subjects.map((subject) {
                  return DropdownMenuItem(
                    child: Text(subject),
                    value: subject,
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _newTopic.subject = value!.toLowerCase();
                  });
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
                if (_validateForm()) {
                  if (await createTopic(_newTopic)) {
                    _clearTextFields();
                    Navigator.of(context).pop();
                  } else {
                    //Set error message:
                  }
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
