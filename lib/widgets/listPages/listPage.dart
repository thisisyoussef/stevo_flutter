import 'package:flutter/material.dart';
import 'package:stevo_flutter/data/app_theme.dart';
import 'package:stevo_flutter/functions/subjectToIcon.dart';
import 'package:stevo_flutter/models/topic.dart';
import 'package:stevo_flutter/widgets/tiles/listCard.dart';
import 'package:stevo_flutter/widgets/tiles/topicListTile.dart';

class ListPage extends StatelessWidget {
  ListPage({super.key, required this.topics, required this.onRefresh});

  //Take in a list of topics:
  List<Topic> topics;

  //Take in a function to refresh the list of topics:
  Function onRefresh;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RefreshIndicator(
        onRefresh: () async {
          await onRefresh();
        },
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: topics.length,
          itemBuilder: (BuildContext context, int index) {
            return ListCard(
              content: topics.elementAt(index),
              child: TopicListTile(topic: topics.elementAt(index)),
            );
          },
        ),
      ),
    );
  }
}
