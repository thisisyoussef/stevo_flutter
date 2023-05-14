import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stevo_flutter/widgets/dialogBoxes/dialogBox.dart';
import 'package:stevo_flutter/widgets/dialogBoxes/testsDialog.dart';
import 'package:stevo_flutter/widgets/homeAppBar.dart';
import 'package:stevo_flutter/widgets/dialogBoxes/topicsDialog.dart';

import '../router.gr.dart';
import '../widgets/welcomeBanner.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
      //One row with two columns. The first column contains two rows. The first row contains two DialogBox widgets. 
      //The second row contains one DialogBox widget. The second column contains one DialogBox widget. Each DialogBox Widget should expand to take up as much space as possible.
      return Scaffold(
        appBar: HomeAppBar(isHomeScreen: true),
        body: Column(
          children: [
            //Add a WelcomeBanner widget here when it is ready.
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: DialogBox(
                                  title: 'Title 1',
                                  subtitle: 'Subtitle 1',
                                  contents: Container(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: DialogBox(
                                  title: 'Title 2',
                                  subtitle: 'Subtitle 2',
                                  contents: Container(
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: DialogBox(
                            title: 'Tests',
                            subtitle: 'Take a test to see how much you know!',
                            contents: TestsDialog(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: DialogBox(
                      title: 'Topics',
                      subtitle: //Explain what topics are
                      'Topics are the main way to learn on Stevo. Stevo creates a simple guided lesson from your material and helps you learn in a fun interactive way for you! Click on a topic to start learning.',
                      contents: TopicsDialog()
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

    );
  }
}