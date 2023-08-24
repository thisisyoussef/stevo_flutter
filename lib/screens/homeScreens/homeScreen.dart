import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:stevo_flutter/data/app_theme.dart';
import 'package:stevo_flutter/data/sharedPreferences.dart';
import 'package:stevo_flutter/data/userInfo.dart';
import 'package:stevo_flutter/functions/subjectToIcon.dart';
import 'package:stevo_flutter/utils/navigationUtils.dart';
import 'package:stevo_flutter/widgets/dialogBoxes/dialogBox.dart';
import 'package:stevo_flutter/widgets/dialogBoxes/testsDialog.dart';
import 'package:stevo_flutter/widgets/dialogBoxes/welsomeDialog.dart';
import 'package:stevo_flutter/widgets/homeAppBar.dart';
import 'package:stevo_flutter/widgets/dialogBoxes/topics/topicsDialog.dart';
import 'package:stevo_flutter/widgets/navigationRails/homeNavigationRail.dart';
import 'package:stevo_flutter/widgets/navigationRails/stevoNavigationRail.dart';

import '../../models/user.dart';
import '../../router.gr.dart';
import '../../widgets/dialogBoxes/pathDialog.dart';
import '../../widgets/welcomeBanner.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget currentScreen = Home();
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //Add a WelcomeBanner widget here when it is ready.
          Expanded(
            child: Row(
              children: [
                HomeNavigationRail(
                  replacementFunction: (Widget newScreen, int newIndex) {
                    //if newIndex is last index, logout
                    if (newIndex == 3) {
                      NavigationUtils.logout(context);
                      return;
                    }
                    //if newIndex is the same as selectedIndex, do nothing
                    if (newIndex == selectedIndex) {
                      return;
                    }
                    setState(() {
                      setState(() {
                        currentScreen = newScreen;
                        selectedIndex = newIndex;
                      });
                    });
                  },
                ),
                Container(
                  child: currentScreen,
                  width: MediaQuery.of(context).size.width * 0.95,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: DialogBox(
              title:
                  '${Provider.of<UserInfo>(context, listen: true).getUserInfo.firstName}' +
                      "'s Stevo Path",
              subtitle: '',
              contents: PathDialog(),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                const Expanded(
                  child: DialogBox(
                      title: 'Topics',
                      subtitle: //Explain what topics are
                          'Topics are the main way to learn on Stevo. Stevo creates a simple guided lesson from your material and helps you learn in a fun interactive way for you! Click on a topic to start learning.',
                      contents: TopicsDialog()),
                ),
                Expanded(
                  child: DialogBox(
                    title: 'My Streak',
                    subtitle: // Explain what streaks are
                        'Streaks are a way to keep you motivated to learn. The more you learn, the longer your streak will be. If you miss a day, your streak will reset to 0. Try to keep your streak going as long as possible!',
                    contents: Container(
                      height: 100,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: false,
            child: const Expanded(
              flex: 1,
              child: DialogBox(
                title: 'Tests',
                subtitle: 'Take a test to see how much you know!',
                contents: TestsDialog(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
