import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stevo_flutter/router.gr.dart';
import 'package:stevo_flutter/utils/navigationUtils.dart';

import '../../app_theme.dart';
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => NavigationUtils.pushTopic(context, topic!),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
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
                  Icon(
                    subjectToIcon(topic?.subject ?? ""),
                    size: 150,
                  ),
                  AutoSizeText(
                    topic?.subject ?? "",
                    style: appTheme.textTheme.headline4,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                  AutoSizeText(
                    topic?.name ?? "",
                    style: appTheme.textTheme.headline2,
                    textAlign: TextAlign.center,
                    maxLines: 1,
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
