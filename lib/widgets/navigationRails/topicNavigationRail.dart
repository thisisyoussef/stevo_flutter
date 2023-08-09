import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stevo_flutter/router.gr.dart';
import 'package:stevo_flutter/screens/assessmentScreens/assessmentOverview.dart';
import 'package:stevo_flutter/screens/homeScreens/homeScreen.dart';
import 'package:stevo_flutter/screens/topicScreen/learnPage.dart';
import 'package:stevo_flutter/screens/topicScreen/materialsScreens/materialsPage.dart';
import 'package:stevo_flutter/screens/topicScreen/topicScreen.dart';
import 'package:stevo_flutter/widgets/navigationRails/stevoNavigationRail.dart';

class TopicNavigationRail extends StatelessWidget {
  TopicNavigationRail(
      {super.key,
      required this.selectedIndex,
      required this.replacementFunction});

  final int selectedIndex;
  Function replacementFunction;

  @override
  Widget build(BuildContext context) {
    List<NavigationRailDestination> destinations = [
      //Logout:
      const NavigationRailDestination(
        icon: Icon(Icons.arrow_back_rounded, color: Colors.white),
        label:
            Text('Back', style: TextStyle(color: Colors.white, fontSize: 10)),
      ),
      const NavigationRailDestination(
        icon: Icon(
          Icons.book_outlined,
          color: Colors.white,
        ),
        label: Text('Materials',
            style: TextStyle(color: Colors.white, fontSize: 10)),
      ),
      const NavigationRailDestination(
        //Exam Icon with a pencil and a paper
        icon: Icon(Icons.assessment_outlined, color: Colors.white),
        label:
            Text('Exams', style: TextStyle(color: Colors.white, fontSize: 10)),
      ),
      const NavigationRailDestination(
        icon: Icon(Icons.lightbulb_outline_rounded, color: Colors.white),
        label:
            Text('Learn', style: TextStyle(color: Colors.white, fontSize: 10)),
      ),
    ];

    List<Widget> routes = [
      const HomeScreen(),
      MaterialsPage(),
      AssessmentOverviewScreen(),
      LearnPage(),
    ];
    return StevoNavigationRail(
      destinations: destinations,
      routes: routes,
      selectedIndex: selectedIndex,
      replacementFunction: replacementFunction,
    );
  }
}
