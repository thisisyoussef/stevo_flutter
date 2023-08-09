import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:stevo_flutter/app_theme.dart';
import 'package:stevo_flutter/data/sharedPreferences.dart';
import 'package:stevo_flutter/router.gr.dart';
import 'package:stevo_flutter/screens/homeScreens/homeScreen.dart';

class StevoNavigationRail extends StatelessWidget {
  //constructor with named parameters
  StevoNavigationRail({
    super.key,
    required this.destinations,
    required this.routes,
    this.selectedIndex = 0,
    required this.replacementFunction,
  });

  List<NavigationRailDestination> destinations;
  List<Widget> routes;
  int selectedIndex = 0;
  Function replacementFunction = () {};

  @override
  Widget build(BuildContext context) {
    //check if routes length is less than destinations length, if so, fill the rest of the routes with the home route
    if (routes.length < destinations.length) {
      for (int i = routes.length; i < destinations.length; i++) {
        routes.add(const HomeScreen());
      }
    }
    return NavigationRail(
      elevation: 5,
      useIndicator: false,
      labelType: NavigationRailLabelType.all,
      backgroundColor: appTheme.primaryColor,
      destinations: destinations,
      selectedIndex: selectedIndex,
      onDestinationSelected: (int index) {
        replacementFunction(routes[index], index);
      },
    );
  }
}
