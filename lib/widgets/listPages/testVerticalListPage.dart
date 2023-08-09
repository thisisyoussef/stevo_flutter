import 'package:flutter/material.dart';
import 'package:stevo_flutter/app_theme.dart';
import 'package:stevo_flutter/functions/subjectToIcon.dart';
import 'package:stevo_flutter/models/assessment.dart';
import 'package:stevo_flutter/models/topic.dart';
import 'package:stevo_flutter/widgets/tiles/listCard.dart';
import 'package:stevo_flutter/widgets/tiles/testListTileVertical.dart';
import 'package:stevo_flutter/widgets/tiles/topicListTile.dart';

class TestVerticalListPage extends StatelessWidget {
  TestVerticalListPage(
      {super.key, required this.tests, required this.onRefresh});

  //Take in a list of topics:
  List<Assessment> tests;

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
          itemCount: tests.length,
          itemBuilder: (BuildContext context, int index) {
            return ListCard(
              content: tests.elementAt(index),
              child: TestListTileVertical(test: tests.elementAt(index)),
            );
          },
        ),
      ),
    );
  }
}
