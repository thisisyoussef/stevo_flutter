//Template page for the learn screen

import 'package:flutter/material.dart';
import 'package:stevo_flutter/widgets/dialogBoxes/dialogBox.dart';
import 'package:stevo_flutter/widgets/dialogBoxes/learningPathDialog.dart';
import 'package:timelines/timelines.dart';

import '../../widgets/tiles/learningPathTile.dart';

class LearnPage extends StatelessWidget {
  LearnPage({Key? key}) : super(key: key);

  static const String name = 'LearnPage';

  //List of Learning Path Tiles:
  List<Widget> learningPathTiles = [
    LearningPathTile(
      current: false,
      complete: true,
      type: "lesson",
      name: "Lesson 1",
      sectionNumber: 1,
    ),
    LearningPathTile(
      current: false,
      complete: true,
      type: "lesson",
      name: "Lesson 2",
      sectionNumber: 2,
    ),
    LearningPathTile(
      current: false,
      complete: true,
      type: "lesson",
      name: "Lesson 3",
      sectionNumber: 3,
    ),
    LearningPathTile(
      current: true,
      complete: false,
      type: "lesson",
      name: "Lesson 4",
      sectionNumber: 4,
    ),
    LearningPathTile(
      current: false,
      complete: false,
      type: "lesson",
      name: "Lesson 5",
      sectionNumber: 5,
    ),
    LearningPathTile(
      current: false,
      complete: false,
      type: "lesson",
      name: "Lesson 6",
      sectionNumber: 6,
    ),
    LearningPathTile(
      current: false,
      complete: false,
      type: "lesson",
      name: "Lesson 7",
      sectionNumber: 7,
    ),
    LearningPathTile(
      current: false,
      complete: false,
      type: "lesson",
      name: "Lesson 8",
      sectionNumber: 8,
    ),
    LearningPathTile(
      current: false,
      complete: false,
      type: "lesson",
      name: "Lesson 9",
      sectionNumber: 9,
    ),
    LearningPathTile(
      current: false,
      complete: false,
      type: "lesson",
      name: "Lesson 10",
      sectionNumber: 10,
    ),
  ];

  //List of objectives:
  List<String> objectives = [
    'Objective 1',
    'Objective 2',
    'Objective 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: DialogBox(
            title: "",
            contents: ScrollablePath(
                scrollTo: //get the first item in learningPathTiles that is current and get its index
                    learningPathTiles.indexWhere(
                        (element) => (element as LearningPathTile).current),
                children: learningPathTiles),
            subtitle: '',
          ),
        ),
        //Dialog Box that contains example content expansion based on selected item,
        //description, name, progress
        Expanded(
            flex: 1,
            child: Container(
              child: Column(children: [
                Text(
                  'Lesson Name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 8.0), // Spacing
                Text(
                  'A detailed description of the lesson...',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: objectives
                      .map((objective) => Text('• $objective'))
                      .toList(),
                ),
                LinearProgressIndicator(
                  value: learningPathTiles.indexWhere(
                          (element) => (element as LearningPathTile).current) /
                      learningPathTiles.length,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              ]),
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white, // Change as needed
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              // The rest of the detailed view content goes here
            )),
      ],
    );
  }
}
