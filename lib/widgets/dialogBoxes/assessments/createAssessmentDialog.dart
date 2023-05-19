//This is meant to be a dialog box that pops up when the user wants to create a new assessment. 
//It should have a button for a quick assessment where the user doesn't have to choose any settings and can just start the assessment.
//It should also have a button for a custom assessment where the user can choose the settings for the assessment.
//The dialog box should switch between the two views via a toggle button at the top of the dialog box.
//The dialog box should also have a button to cancel the creation of the assessment.
//For the custom assessment, the dialog box should have different types of mechanisms to choose the settings for the assessment.
//For the number of questions, the user should be able to choose between a slider.
//For the time limit, the user should be able to choose between a slider.
//For the difficulty, the user should be able to choose from a dropdown menu.
//For the materials, the user should be able to choose from a list of checkboxes.

//The dialog box will take in a Topic object to display the name of the topic at the top of the dialog box
//as well as to display the materials that the user can choose from.

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stevo_flutter/router.gr.dart';

class CreateAssessmentDialog extends StatefulWidget {
  const CreateAssessmentDialog({
    Key? key,
  }) : super(key: key);

  @override
  _CreateAssessmentDialogState createState() => _CreateAssessmentDialogState();
}

class _CreateAssessmentDialogState extends State<CreateAssessmentDialog> {
  bool isQuickAssessment = true;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Create Assessment'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Topic Name'),
          Text('Materials'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    isQuickAssessment = true;
                  });
                },
                child: Text('Quick Assessment'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    isQuickAssessment = false;
                  });
                },
                child: Text('Custom Assessment'),
              ),
            ],
          ),
          if (isQuickAssessment)
            Column(
              children: [
                Text('Quick Assessment'),
                Text('Quick Assessment'),
                Text('Quick Assessment'),
              ],
            ),
          if (!isQuickAssessment)
            Column(
              children: [
                Text('Custom Assessment'),
                Text('Custom Assessment'),
                Text('Custom Assessment'),
              ],
            ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.router.pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            context.router.pop();
          },
          child: Text('Create'),
        ),
      ],
    );
  }
}