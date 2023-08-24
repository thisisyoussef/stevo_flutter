import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:stevo_flutter/data/app_theme.dart';
import 'package:stevo_flutter/data/userInfo.dart';
import 'package:stevo_flutter/router.gr.dart';
import 'package:stevo_flutter/services/assessment.dart';
import 'package:stevo_flutter/widgets/buttons/customButton.dart';

import '../../../models/assessment.dart';
import '../../buttons/difficultyButton.dart';

class CreateAssessmentDialog extends StatefulWidget {
  const CreateAssessmentDialog({
    Key? key,
  }) : super(key: key);

  @override
  _CreateAssessmentDialogState createState() => _CreateAssessmentDialogState();
}

class _CreateAssessmentDialogState extends State<CreateAssessmentDialog> {
  TextEditingController _hoursController = TextEditingController();
  TextEditingController _minutesController = TextEditingController();

  @override
  void dispose() {
    _hoursController.dispose();
    _minutesController.dispose();
    super.dispose();
  }

  bool isQuickAssessment = true;
  int numberOfQuestions = 10;
  bool mcq = true;
  bool fillInTheBlank = false;
  bool trueOrFalse = false;
  bool shortAnswer = false;
  String assessmentName = '';
  String? difficulty = 'Easy';
  int timeLimitHours = 0;
  int timeLimitMinutes = 0;
  String errorMessage = '';

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
                //error message area:
                Text(
                  errorMessage,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //Input for the name of the assessment:
                SizedBox(width: 16),
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Assessment Name',
                    ),
                    onChanged: (value) {
                      setState(() {
                        assessmentName = value;
                        print("Assessment name is:" + assessmentName);
                      });
                    },
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
                    value: mcq,
                    onChanged: (bool value) {
                      setState(() {
                        mcq = value;
                      });
                    },
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
                    value: fillInTheBlank,
                    onChanged: (bool value) {
                      setState(() {
                        fillInTheBlank = value;
                      });
                    },
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
                    value: trueOrFalse,
                    onChanged: (bool value) {
                      setState(() {
                        trueOrFalse = value;
                      });
                    },
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
                    value: shortAnswer,
                    onChanged: (bool value) {
                      setState(() {
                        shortAnswer = value;
                      });
                    },
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
                    border: Border.all(
                        color: appTheme.primaryColor.withOpacity(0.5)),
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
            //Time Picker for the duration of the assessment:
            //Code:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Duration in Minutes',
                ),
                //SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: appTheme.primaryColor.withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        //should be a minus icon
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (timeLimitMinutes > 0) {
                              timeLimitMinutes--;
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
                            text: timeLimitMinutes.toString(),
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            if (timeLimitMinutes < 60) {
                              timeLimitMinutes++;
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
            //Dropdown for difficulty of the questions in the assessment (Easy, Medium, Hard):
            //Code:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Difficulty Text
                Text('Difficulty'),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DifficultyButton(
                      difficulty: "Easy",
                      onPressed: () {
                        setState(() {
                          difficulty = "Easy";
                        });
                      },
                      isSelected: difficulty == "Easy" ? true : false,
                    ),
                    DifficultyButton(
                      difficulty: "Medium",
                      onPressed: () {
                        setState(() {
                          difficulty = "Medium";
                        });
                      },
                      isSelected: difficulty == "Medium" ? true : false,
                    ),
                    DifficultyButton(
                      difficulty: "Hard",
                      onPressed: () {
                        setState(() {
                          difficulty = "Hard";
                        });
                      },
                      isSelected: difficulty == "Hard" ? true : false,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 30),
            //Button to create the assessment:
            CustomButton(
              text: "Start Assessment",
              onPressed: () async {
                //start loading
                context.loaderOverlay.show();
                var data = await generateAssessment(
                    assessmentName,
                    numberOfQuestions,
                    difficulty!,
                    Provider.of<UserInfo>(context, listen: false)
                        .currentTopic
                        .id!);
                //if data is false, stop loading and show error
                if (data == false) {
                  context.loaderOverlay.hide();
                  //set error message
                  setState(() {
                    //Set a user friendly error message
                    errorMessage =
                        "There was an error creating the assessment. Please try again.";
                  });
                  return;
                } else {
                  //if data is not false, stop loading and go to test overview
                  context.loaderOverlay.hide();
                  print(data);
                  Provider.of<UserInfo>(context, listen: false)
                      .loadTest(data['_id']);
                  context.router.push(TestOverviewRoute());
                }
              },
              icon: Icons.play_arrow,
            ),
          ],
        ),
      ),
    );
  }
}
