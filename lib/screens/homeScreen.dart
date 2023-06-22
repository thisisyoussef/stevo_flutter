import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:stevo_flutter/app_theme.dart';
import 'package:stevo_flutter/data/sharedPreferences.dart';
import 'package:stevo_flutter/widgets/dialogBoxes/dialogBox.dart';
import 'package:stevo_flutter/widgets/dialogBoxes/testsDialog.dart';
import 'package:stevo_flutter/widgets/homeAppBar.dart';
import 'package:stevo_flutter/widgets/dialogBoxes/topics/topicsDialog.dart';

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
      body: Column(
        children: [
          //Add a WelcomeBanner widget here when it is ready.
          Expanded(
            child: Row(
              children: [
                //NavigationRale widget:
                NavigationRail(
                  elevation: 5,
                  labelType: NavigationRailLabelType.all,
                  backgroundColor: appTheme.primaryColor,
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      label: Text('Home',
                          style: TextStyle(color: Colors.white, fontSize: 10)),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.book, color: Colors.white),
                      label: Text('Library',
                          style: TextStyle(color: Colors.white, fontSize: 10)),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.person, color: Colors.white),
                      label: Text('Profile',
                          style: TextStyle(color: Colors.white, fontSize: 10)),
                    ),
                    //Logout:
                    NavigationRailDestination(
                      icon: Icon(Icons.logout, color: Colors.white),
                      label: Text('Logout',
                          style: TextStyle(color: Colors.white, fontSize: 10)),
                    ),
                  ],
                  selectedIndex: 0,
                  onDestinationSelected: (int index) {
                    //Load:
                    context.loaderOverlay.show();
                    switch (index) {
                      case 0:
                        context.router.push(HomeRoute());
                        context.loaderOverlay.hide();
                        break;
                      case 1:
                        //context.router.push(LibraryRoute());
                        context.loaderOverlay.hide();
                        break;
                      case 2:
                        //context.router.push(ProfileRoute());
                        context.loaderOverlay.hide();
                        break;
                      case 3:
                        logout();
                        context.loaderOverlay.hide();
                        context.router.push(LoginRoute());
                        break;
                    }
                    context.loaderOverlay.hide();
                  },
                ),
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
                      contents: TopicsDialog()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
