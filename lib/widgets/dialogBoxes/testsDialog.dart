import 'package:flutter/material.dart';
import 'package:stevo_flutter/widgets/customButton.dart';
import 'package:stevo_flutter/widgets/listPages/horizontalListPage.dart';
import 'package:stevo_flutter/widgets/listPages/listPage.dart';

import '../../models/test.dart';

//This is the content for the "Tests" dialog box in the Home Screen.
//It is meant to show a horizontal list view of cards with info about tests on them
//There will always be one card that is visible, and the user can press on the left and right arrows to scroll through the cards.
// Beneath the cards, there should be a "View all tests" button and a "Create a new test" button and a "Find a test online" button.
// For the cards widget, for now use a temporary container with a color to represent the card.

class TestsDialog extends StatelessWidget {
  const TestsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: HorizontalListPage(
            listContent: [
              //Enter placeholder tests here:
              Test(
                  name: "Test 1",
                  subject: "Language",
                  id: '1',
                  lastScore: 0.88,
                  totalAttempts: 5,
                  numberOfQuestions: 10,
                  difficulty: "Easy"),
              Test(
                  name: "Test 2",
                  subject: "Math",
                  id: '2',
                  lastScore: 0.88,
                  totalAttempts: 5,
                  numberOfQuestions: 10,
                  difficulty: "Easy"),
              Test(
                  name: "Test 3",
                  subject: "Science",
                  id: '3',
                  lastScore: 0.88,
                  totalAttempts: 5,
                  numberOfQuestions: 10,
                  difficulty: "Easy"),
              Test(
                  name: "Test 4",
                  subject: "Subject 4",
                  id: '4',
                  lastScore: 0.88,
                  totalAttempts: 5,
                  numberOfQuestions: 10,
                  difficulty: "Easy"),
            ],
          ),
        ),
        Container(
          height: 100,
          child:
              //Row of buttons
              Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: "View all tests",
                  icon: Icons.list,
                  onPressed: () {
                    print("Tapped on View all tests button");
                    //add navigation to new screen here
                  },
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: CustomButton(
                  text: "Create a new test",
                  icon: Icons.add,
                  onPressed: () {
                    print("Tapped on Create a new test button");
                    //add navigation to new screen here
                  },
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: CustomButton(
                  text: "Find a test online",
                  icon: Icons.search,
                  onPressed: () {
                    print("Tapped on Find a test online button");
                    //add navigation to new screen here
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
