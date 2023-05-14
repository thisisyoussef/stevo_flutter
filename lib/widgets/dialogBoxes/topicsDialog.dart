import 'package:flutter/material.dart';
import 'package:stevo_flutter/widgets/customButton.dart';
import 'package:stevo_flutter/widgets/listPages/listPage.dart';
import '../../models/topic.dart';

//This is the content for the "Topics" dialog box in the Home Screen.
//It is meant to show a grid of topics that the user can choose from.
//If there are more topics than can fit on the screen, there should be a "View all topics" button at the bottom of the dialog box.
//If there are no topics, there should be a "Start a new topic" button at the center of the widget.
//There should alwats be a "Start a new topic" button regardless of whether there are topics or not.

class TopicsDialog extends StatelessWidget {
  const TopicsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(child: ListPage(topics: [
          //Enter placeholder topics here:
          Topic(title: "Topic 1", description: "English", subject: "Language", difficulty: "hard", id: "1"),
          Topic(title: "Topic 2", description: "Calculus", subject: "Math", difficulty: "easy", id: "2"),
          Topic(title: "Topic 3", description: "Physics", subject: "Science", difficulty: "medium", id: "3"),
          Topic(title: "Topic 4", description: "Description 4", subject: "Subject 4", difficulty: "hard", id: "4"),
          Topic(title: "Topic 5", description: "Description 5", subject: "Subject 5", difficulty: "easy", id: "5"),
        ],)),
        Container(height: 100,
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
    const SizedBox(width: 10,),
    Expanded(
      child: CustomButton(
        text: "Start a new topic",
        icon: Icons.add,
        onPressed: () {
          print("Tapped on Start a new topic button");
          //add navigation to new screen here
        },
      ),
    ),
    const SizedBox(width: 10,),
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
      ]
    );
    }
}
