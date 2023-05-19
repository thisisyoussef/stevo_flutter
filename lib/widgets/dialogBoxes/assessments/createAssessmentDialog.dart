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

import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stevo_flutter/router.gr.dart';
import 'package:stevo_flutter/widgets/customButton.dart';

class CreateAssessmentDialog extends StatefulWidget {
  const CreateAssessmentDialog({
    Key? key,
  }) : super(key: key);

  @override
  _CreateAssessmentDialogState createState() => _CreateAssessmentDialogState();
}

class _CreateAssessmentDialogState extends State<CreateAssessmentDialog> {
  bool isQuickAssessment = true;
  int numberOfQuestions = 10;

  List<Widget> _segmentedControlChildren() => [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Quick Assessment'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Custom Assessment'),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:
          //"Create Assessment" and a cancel icon button:
          Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Create Assessment'),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.cancel),
          ),
        ],
      ),
      content: Container(
        width: MediaQuery.of(context).size.width * 0.33,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Input for the name of the assessment:
                SizedBox(width: 16),
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Assessment Name',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              //Set of Checkboxes for the types of questions in the assessment (MCQ, Fill in the blanks, True or False, Written):
              //Code:
              //Title:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Question Types'),
                  SwitchListTile(
                    title: Text(
                      'Multiple Choice Questions',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    value: false,
                    onChanged: (bool value) {},
                    activeColor: Colors.green,
                  ),
                  SwitchListTile(
                    title: Text(
                      'Fill in the Blanks',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    value: false,
                    onChanged: (bool value) {},
                    activeColor: Colors.green,
                  ),
                  SwitchListTile(
                    title: Text(
                      'True or False',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    value: false,
                    onChanged: (bool value) {},
                    activeColor: Colors.green,
                  ),
                  SwitchListTile(
                    title: Text(
                      'Written',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    value: false,
                    onChanged: (bool value) {},
                    activeColor: Colors.green,
                  ),
                ],
              )

              //Set of Radio Buttons for the difficulty of the questions in the assessment (Easy, Medium, Hard):
              //Code:
            ]),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Number of Questions',
                ),
                //SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_left),
                        onPressed: () {
                          setState(() {
                            if (numberOfQuestions > 1) {
                              numberOfQuestions--;
                            }
                          });
                        },
                      ),
                      Container(
                        width: 50,
                        child: TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(2),
                            FilteringTextInputFormatter.allow(RegExp(r'[1-9]')),
                          ],
                          controller: TextEditingController(
                            text: numberOfQuestions.toString(),
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_right),
                        onPressed: () {
                          setState(() {
                            if (numberOfQuestions < 30) {
                              numberOfQuestions++;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Time Limit',
                ),
                //SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_left),
                        onPressed: () {},
                      ),
                      Container(
                        width: 50,
                        child: TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(2),
                            FilteringTextInputFormatter.allow(RegExp(r'[1-9]')),
                          ],
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_right),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            //Dropdown for difficulty of the questions in the assessment (Easy, Medium, Hard):
            //Code:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Difficulty',
                ),
                //SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(children: [
                    DropdownButton(
                      value: null,
                      onChanged: (newValue) {
                        setState(() {});
                      },
                      items: <String>['Easy', 'Medium', 'Hard']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                          ),
                        );
                      }).toList(),
                    ),
                  ]),
                ),
              ],
            ),
            SizedBox(height: 30),
            //Button to create the assessment:
            CustomButton(
              text: "Create Assessment",
              onPressed: () {},
              icon: Icons.add,
            ),
          ],
        ),
      ),
    );
  }
}
