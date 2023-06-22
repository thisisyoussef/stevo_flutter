import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stevo_flutter/services/topic.dart';
import 'package:stevo_flutter/widgets/buttons/customButton.dart';
import 'package:stevo_flutter/widgets/dialogBoxes/topics/createTopicDialog.dart';
import 'package:stevo_flutter/widgets/listPages/listPage.dart';
import '../../../data/userInfo.dart';
import '../../../models/topic.dart';

//This is the content for the "Topics" dialog box in the Home Screen.
//It is meant to show a grid of topics that the user can choose from.
//If there are more topics than can fit on the screen, there should be a "View all topics" button at the bottom of the dialog box.
//If there are no topics, there should be a "Start a new topic" button at the center of the widget.
//There should always be a "Start a new topic" button regardless of whether there are topics or not.

class TopicsDialog extends StatelessWidget {
  const TopicsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Provider.of<UserInfo>(context, listen: false).loadTopics();
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //if there are no topics, show a "Start a new topic" button
          Provider.of<UserInfo>(context, listen: true).topics.isEmpty
              ? CustomButton(
                  text: "Start a new topic",
                  icon: Icons.add,
                  onPressed: () {
                    print("Tapped on Start a new topic button");
                    //add navigation to new screen here
                  },
                )
              : Expanded(
                  child: ListPage(
                  topics:
                      //Get topics from UserInfo provider
                      Provider.of<UserInfo>(context, listen: true).topics,
                  onRefresh: () {
                    Provider.of<UserInfo>(context, listen: false).loadTopics();
                  },
                )),
          Container(
            height: 100,
            child:
                //Row of buttons
                Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: "View all topics",
                    icon: Icons.list,
                    onPressed: () {
                      print("Tapped on View all topics button");
                      //add navigation to new screen here
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomButton(
                    text: "Start a new topic",
                    icon: Icons.add,
                    onPressed: () {
                      print("Tapped on Start a new topic button");
                      //push create topic dialog box:
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CreateTopicDialog();
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomButton(
                    text: "Find a topic online",
                    icon: Icons.search,
                    onPressed: () {
                      print("Tapped on Find a topic online button");
                      //add navigation to new screen here
                    },
                  ),
                ),
              ],
            ),
          ),
        ]);
  }
}
