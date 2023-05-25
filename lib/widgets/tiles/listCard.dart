
import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  ListCard({super.key, required this.content, required this.child});

  //Take in a topic:
  dynamic content;
  Widget child;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: MediaQuery.of(context).size.width * 0.3,
      child: Card(
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
          decoration: BoxDecoration(),
          child: child,
        ),
      ),
    );
  }
}