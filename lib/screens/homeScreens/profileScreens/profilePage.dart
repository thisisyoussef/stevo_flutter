import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stevo_flutter/data/app_theme.dart';
import 'package:stevo_flutter/screens/homeScreens/profileScreens/settingsPage.dart';
import 'package:stevo_flutter/screens/homeScreens/profileScreens/userProfilePage.dart';

import '../../../data/userInfo.dart';
import '../../../models/user.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static const String name = 'ProfilePage';

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 16),
            CupertinoSlidingSegmentedControl(
              groupValue: _selectedIndex,
              children: <int, Widget>{
                0: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person,
                      size: 24,
                      color:
                          _selectedIndex == 0 ? Colors.white : Colors.grey[600],
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: _selectedIndex == 0
                            ? Colors.white
                            : Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                1: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.settings,
                      size: 24,
                      color:
                          _selectedIndex == 1 ? Colors.white : Colors.grey[600],
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: _selectedIndex == 1
                            ? Colors.white
                            : Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              },
              thumbColor: appTheme.primaryColor,
              backgroundColor: Colors.grey[200]!,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              onValueChanged: (int? value) {
                setState(() {
                  _selectedIndex = value!;
                });
              },
            ),
            _selectedIndex == 0 ? UserProfilePage() : SettingsPage(),
          ],
        ),
      ),
    );
  }
}
