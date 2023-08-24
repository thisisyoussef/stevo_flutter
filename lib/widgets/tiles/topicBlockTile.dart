import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stevo_flutter/router.gr.dart';
import 'package:stevo_flutter/utils/navigationUtils.dart';

import '../../data/app_theme.dart';
import '../../functions/subjectToIcon.dart';
import '../../models/topic.dart';
import 'package:auto_size_text/auto_size_text.dart';

class TopicBlock extends StatelessWidget {
  TopicBlock({
    super.key,
    required this.topic,
  });

  Topic? topic;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color iconColor;

    switch (topic?.subject) {
      case "math":
        backgroundColor = Colors.blue[200]!;
        iconColor = Colors.blue[800]!;
        break;
      case "science":
        backgroundColor = Colors.green[200]!;
        iconColor = Colors.green[800]!;
        break;
      case "History":
        backgroundColor = Colors.orange[200]!;
        iconColor = Colors.orange[800]!;
        break;
      case "English":
        backgroundColor = Colors.purple[200]!;
        iconColor = Colors.purple[800]!;
        break;
      default:
        backgroundColor = Colors.grey[200]!;
        iconColor = Colors.grey[800]!;
        break;
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => NavigationUtils.pushTopic(context, topic!),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                backgroundColor,
                backgroundColor.withOpacity(0.6),
              ],
            ),
            borderRadius: BorderRadius.circular(10.0),
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
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
            child: Container(
              width: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                      padding: const EdgeInsets.all(20.0),
                      child: Icon(
                        subjectToIcon(topic?.subject ?? ""),
                        size: 80,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  AutoSizeText(
                    topic?.name ?? "",
                    style: appTheme.textTheme.headline4!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => NavigationUtils.pushTopic(context, topic!),
                    child: Text(
                      "View Topic",
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
        ),
      ),
    );
  }
}
