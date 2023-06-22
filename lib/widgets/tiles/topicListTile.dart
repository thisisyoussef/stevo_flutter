import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stevo_flutter/data/userInfo.dart';

import '../../app_theme.dart';
import '../../functions/subjectToIcon.dart';
import '../../models/topic.dart';
import '../../router.gr.dart';

class TopicListTile extends StatelessWidget {
  TopicListTile({super.key, required this.topic});

  //Take in a topic:
  Topic topic;

  @override
  Widget build(BuildContext context) {
    //print all topic values:
    return GestureDetector(
      onTap: () {
        Provider.of<UserInfo>(context, listen: false).setCurrentTopic(topic);
        Provider.of<UserInfo>(context, listen: false).loadMaterials();
        context.router.push(TopicRoute());
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
              topic.subject == null
                  ? Icons.help
                  : subjectToIcon(topic.subject!),
            ),
          ),
          title: Text(
            topic.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

          subtitle: Row(
            children: <Widget>[
              Icon(Icons.linear_scale),
              Text(" Intermediate", style: TextStyle())
            ],
          ),
          trailing: Icon(Icons.keyboard_arrow_right, size: 30.0)),
    );
  }
}
