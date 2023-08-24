import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:stevo_flutter/data/userInfo.dart';
import 'package:stevo_flutter/router.gr.dart';
import 'package:stevo_flutter/widgets/buttons/customButton.dart';

import '../../data/app_theme.dart';
import '../../functions/subjectToIcon.dart';
import '../../models/assessment.dart';
import 'package:stevo_flutter/utils/navigationUtils.dart';

class TestListTile extends StatelessWidget {
  TestListTile({super.key, required this.test});

  //Take in a test:
  Assessment test;

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          //
          //Build a test card overview that shows the test's name, subject, and icon.
          // It also shows the test's difficulty and the number of questions in the test.
          // It should also show the last score the user got on the test.
          //Do this all with columns and rows. Also add a row of three buttons at the bottom.
          //The buttons should be "Take test", "View test", and "Delete test".

          //Code:
          //Column of rows
          Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Row of Info
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              //Subject Icon, Test Name, and Difficulty
              //Subject Icon
              Icon(subjectToIcon(test.subject)),
              //Test Name
              Text(test.name),
              //Difficulty
              Text(
                test.difficulty,
              ),
            ]),
            //Row of Info: Number of Questions and Last Score both with colored icons
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Number of Questions
                Row(
                  children: [
                    Icon(
                      Icons.question_answer,
                      size: 30,
                    ),
                    Text("Number of Questions: " +
                        test.questions.length.toString()),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                //Last Score
                Row(
                  children: [
                    Icon(
                      Icons.score,
                      size: 30,
                    ),
                    Text("Last score: " +
                        (test.lastScore * 100).toString() +
                        "%"),
                  ],
                ),
              ],
            ),

            //Row of Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  flex: 1,
                  child: CustomButton(
                    text: "",
                    onPressed: () {},
                    icon: Icons.shuffle,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  flex: 1,
                  child: CustomButton(
                    text: "",
                    onPressed: () {
                      print("Tapped on Take Test button");
                      //load the test into UserInfo and navigate to the test screen
                      context.loaderOverlay.show();
                      NavigationUtils.pushAndLoadTestOverview(context, test.id);
                    },
                    icon: Icons.play_arrow,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  flex: 1,
                  child: CustomButton(
                    text: "",
                    onPressed: () {
                      //set current test to this test
                      NavigationUtils.pushAndSetAttemptsForTest(
                          context, test, "Topic ID");
                    },
                    icon: Icons.remove_red_eye,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
