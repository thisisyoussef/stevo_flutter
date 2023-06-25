//This is an mcq box widget that is used to display a full mcq question and its options.
//The widget takes in a Question object and displays the question and its options.
//It also takes in a callback that is called when the user selects an option.

import 'package:flutter/material.dart';
import 'package:stevo_flutter/models/question.dart';

class MCQBox extends StatefulWidget {
  MCQBox({Key? key, required this.question, required this.onUpdate})
      : super(key: key);

  final MCQ question;
  final Function onUpdate;

  @override
  State<MCQBox> createState() => _MCQBoxState();
}

class _MCQBoxState extends State<MCQBox> {
  int? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text(widget.question.question!),
          ),
          for (var option in widget.question.options)
            RadioListTile(
              title: Text(option),
              groupValue: selectedOption,
              value: widget.question.options.indexOf(option),
              onChanged: (value) {
                setState(() {
                  selectedOption = value;
                  //get the string value of the selected option
                });
                String selectedOptionString =
                    widget.question.options[selectedOption!];
                widget.onUpdate(selectedOptionString);
              },
            ),
        ],
      ),
    );
  }
}
