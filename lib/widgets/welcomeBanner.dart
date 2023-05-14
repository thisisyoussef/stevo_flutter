import 'package:flutter/material.dart';

//A banner that displays a welcome dialog box under the app bar when the user opens the app. 
//The banner contains two columns. The first column contains two widget. The first widget is a Welcome message. 
//The second widget is a column that contains an "Overview" title and a row underneath it. The row contains rows with icons that display stats stats such as "Hours spent", "Test Results", and "Topics Completed".
//The second column contains a list of quick action buttons such as "Start a new topic", "Take a test", and "View all topics".
//This banner should cover the whole width of the screen. It should also stick to the top of the screen.

class WelcomeBanner extends StatelessWidget {
  const WelcomeBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //The banner should cover the whole width of the screen.
      width: MediaQuery.of(context).size.width,
      //The banner should stick to the top of the screen.
      //The banner should have a border only from the bottom.
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
        color: Colors.blue
      ),
      //The banner should be the same color as the app bar.
      child: 
      Column(children: [
        Text("Welcome to Stevo!"),
      ],),
    ); 
    
    }
}