import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stevo_flutter/data/userInfo.dart';
import 'package:stevo_flutter/models/assessment.dart';
import 'package:stevo_flutter/utils/navigationUtils.dart';

import '../../app_theme.dart';
import '../../functions/subjectToIcon.dart';
import '../../models/topic.dart';
import '../../router.gr.dart';

class TestListTileVertical extends StatelessWidget {
  TestListTileVertical({super.key, required this.test});

  //Take in a test:
  Assessment test;

  @override
  Widget build(BuildContext context) {
    //print all topic values:
    return GestureDetector(
      onTap: () {
        NavigationUtils.pushAndLoadTestOverview(context, test.id);
      },
      child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right:
                        BorderSide(width: 1.0, color: appTheme.primaryColor))),
            child: Icon(
              //if the topic has a subject, use the subjectToIcon function to get the icon for that subject:
              test.subject == null ? Icons.help : subjectToIcon(test.subject!),
            ),
          ),
          title: Text(
            test.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

          subtitle: Row(
            children: <Widget>[
              Icon(
                test.difficulty == "easy"
                    ? Icons.linear_scale
                    : test.difficulty == "medium"
                        ? Icons.linear_scale_sharp
                        : test.difficulty == "hard"
                            ? Icons.linear_scale_outlined
                            : Icons.linear_scale_rounded,
              ),
              Text(
                  test.difficulty == "easy"
                      ? " Easy"
                      : test.difficulty == "medium"
                          ? " Medium"
                          : test.difficulty == "hard"
                              ? " Hard"
                              : " Easy",
                  style: TextStyle(
                      color: test.difficulty == "easy"
                          ? Colors.green
                          : test.difficulty == "medium"
                              ? Colors.yellow
                              : test.difficulty == "hard"
                                  ? Colors.red
                                  : Colors.green))
            ],
          ),
          trailing: Icon(Icons.keyboard_arrow_right, size: 30.0)),
    );
  }
}
