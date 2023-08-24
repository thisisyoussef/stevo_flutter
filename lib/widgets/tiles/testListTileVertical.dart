import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stevo_flutter/data/userInfo.dart';
import 'package:stevo_flutter/models/assessment.dart';
import 'package:stevo_flutter/utils/navigationUtils.dart';

import '../../data/app_theme.dart';
import '../../functions/subjectToIcon.dart';
import '../../models/topic.dart';
import '../../router.gr.dart';

class TestListTileVertical extends StatelessWidget {
  TestListTileVertical({super.key, required this.test});

  //Take in a test:
  Assessment test;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color iconColor;
    switch (test.difficulty) {
      case "medium":
        backgroundColor = Colors.orange[400]!;
        iconColor = Colors.orange[800]!;
        break;
      case "hard":
        backgroundColor = Colors.red[400]!;
        iconColor = Colors.red[800]!;
        break;
      default:
        backgroundColor = Colors.green[400]!;
        iconColor = Colors.green[800]!;
        break;
    }

    return GestureDetector(
      onTap: () {
        NavigationUtils.pushAndLoadTestOverview(context, test.id);
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              backgroundColor,
              backgroundColor.withOpacity(0.8),
            ],
          ),
          border: Border.all(
            color: backgroundColor,
            width: 2.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: iconColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(
                        test.difficulty == "easy"
                            ? Icons.whatshot
                            : test.difficulty == "medium"
                                ? Icons.fireplace
                                : Icons.local_fire_department,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        test.name,
                        style: appTheme.textTheme.headline6!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "${test.questions.length} questions",
                        style: appTheme.textTheme.subtitle1!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  NavigationUtils.pushAndLoadTestOverview(context, test.id);
                },
                child: Text(
                  "Take Test",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: iconColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
