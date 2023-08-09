import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stevo_flutter/router.gr.dart';
import 'package:stevo_flutter/screens/homeScreens/homeScreen.dart';
import 'package:stevo_flutter/screens/homeScreens/libraryPage.dart';
import 'package:stevo_flutter/screens/homeScreens/profilePage.dart';
import 'package:stevo_flutter/screens/loginScreen.dart';
import 'package:stevo_flutter/widgets/navigationRails/stevoNavigationRail.dart';

class HomeNavigationRail extends StatelessWidget {
  HomeNavigationRail({super.key, required this.replacementFunction});

  Function replacementFunction;

  @override
  Widget build(BuildContext context) {
    List<NavigationRailDestination> destinations = [
      const NavigationRailDestination(
        icon: Icon(
          Icons.home,
          color: Colors.white,
        ),
        label:
            Text('Home', style: TextStyle(color: Colors.white, fontSize: 10)),
      ),
      const NavigationRailDestination(
        icon: Icon(Icons.book, color: Colors.white),
        label: Text('Library',
            style: TextStyle(color: Colors.white, fontSize: 10)),
      ),
      const NavigationRailDestination(
        icon: Icon(Icons.person, color: Colors.white),
        label: Text('Profile',
            style: TextStyle(color: Colors.white, fontSize: 10)),
      ),
      //Logout:
      const NavigationRailDestination(
        icon: Icon(Icons.logout, color: Colors.white),
        label:
            Text('Logout', style: TextStyle(color: Colors.white, fontSize: 10)),
      ),
    ];
    List<Widget> routes = [
      const HomeScreen(),
      const LibraryPage(),
      const ProfilePage(),
      LoginScreen()
    ];
    return StevoNavigationRail(
      destinations: destinations,
      routes: routes,
      replacementFunction: replacementFunction,
    );
  }
}
