import 'dart:ui';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:stevo_flutter/app_theme.dart';
import 'package:stevo_flutter/widgets/dialogBoxes/dialogBox.dart';

import '../../models/topic.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../widgets/customButton.dart';
//materialsScreen:
import './materialsScreens/materialsPage.dart';


@RoutePage()
class TopicScreen extends StatefulWidget {
  TopicScreen({super.key, required this.topic});
  Topic topic;

  @override
  State<TopicScreen> createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {
  int _selectedIndex = 0;

   final List<Widget> _pages = [
    MaterialsPage(),
    Container(color: Colors.black, height: 100,),
    Container(color: Colors.blue, height: 300,),
  ];


  void _onItemTapped(int index) {
    print("Tapped on item");
    print("Index: $index");
    setState(() {
      _selectedIndex = index;
    });
    print("widget.selectedIndex: ${_selectedIndex}");

    switch (index) {
      case 0:
        // Navigate to MaterialsPage
        break;
      case 1:
        // Navigate to OverviewPage
        break;
      case 2:
        // Navigate to AssessmentsPage
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(widget.topic.title),
      ),
      bottomNavigationBar: 
      TopicBottomNavBar(selectedIndex: _selectedIndex, onItemTapped: _onItemTapped,),
      body: 
      _pages[_selectedIndex],
       );
  }
}


class TopicBottomNavBar extends StatefulWidget {
  TopicBottomNavBar({Key? key, required this.selectedIndex, required this.onItemTapped}) : super(key: key);
  int selectedIndex;
  final Function(int) onItemTapped;

  @override
  _TopicBottomNavBarState createState() => _TopicBottomNavBarState();
}

class _TopicBottomNavBarState extends State<TopicBottomNavBar> {


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.book_online_outlined),
          label: 'Materials',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Overview',
          backgroundColor: Colors.purple,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assessment_outlined),
          label: 'Assessments',
          backgroundColor: Colors.green,
        ),
      ],
      selectedItemColor: appTheme.canvasColor,
      currentIndex: widget.selectedIndex,
      onTap: widget.onItemTapped,
    );
  }
}

