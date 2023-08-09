import 'dart:ui';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stevo_flutter/app_theme.dart';
import 'package:stevo_flutter/data/userInfo.dart';
import 'package:stevo_flutter/widgets/dialogBoxes/dialogBox.dart';
import 'package:stevo_flutter/widgets/navigationRails/homeNavigationRail.dart';
import 'package:stevo_flutter/widgets/navigationRails/stevoNavigationRail.dart';
import 'package:stevo_flutter/widgets/navigationRails/topicNavigationRail.dart';

import '../../models/topic.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../widgets/buttons/customButton.dart';
//materialsScreen:
import './materialsScreens/materialsPage.dart';

@RoutePage()
class TopicScreen extends StatefulWidget {
  TopicScreen({super.key});

  @override
  State<TopicScreen> createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {
  Widget currentScreen = MaterialsPage();
  int selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          TopicNavigationRail(
            selectedIndex: selectedIndex,
            replacementFunction: (Widget newScreen, int newIndex) {
              //if new index = old index, do nothing
              if (newIndex == selectedIndex) {
                return;
              }
              if (newIndex == 0) {
                Navigator.of(context).pop();
              } else {
                setState(() {
                  currentScreen = newScreen;
                  selectedIndex = newIndex;
                });
              }
            },
          ),
          Expanded(child: currentScreen),
        ],
      ),
    );
  }
}
