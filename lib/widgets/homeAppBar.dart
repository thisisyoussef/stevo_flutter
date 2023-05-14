import 'package:flutter/material.dart';

//Create a custom AppBar widget that displays the logo on the left, a list of pages in the center (Add placeholders for now), and a row of search icon, notification icon, and profile icon on the right.
class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  HomeAppBar({Key? key, required this.isHomeScreen}) : super(key: key);

  bool isHomeScreen = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppBar(
          leading: //Add temporary placeholder for logo here:
          const Placeholder(
            fallbackHeight: 50,
            fallbackWidth: 50,
          ),
          title: Row(
            children: [
              //Add Buttons for each page here: (Add placeholders for now)
              TextButton(
                onPressed: () {},
                child: Text("Home"),
              ),
              TextButton(
                onPressed: () {},
                child: Text("Topics"),
              ),
              TextButton(
                onPressed: () {},
                child: Text("Messages"),
              ),

            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.person),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}