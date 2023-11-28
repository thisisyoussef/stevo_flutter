import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:stevo_flutter/data/app_theme.dart';

class LearningPathTile extends StatelessWidget {
  final String type; // "lesson" or "quiz"
  final String name;
  final int sectionNumber;
  final bool current;
  final bool complete;

  LearningPathTile({
    Key? key,
    required this.type,
    required this.name,
    required this.sectionNumber,
    required this.current,
    required this.complete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color iconColor;

    if (complete) {
      backgroundColor = Colors.grey[200]!;
      iconColor = Colors.grey[800]!;
    } else {
      switch (type) {
        case "lesson":
          backgroundColor = Colors.blue[200]!;
          iconColor = Colors.blue[800]!;
          break;
        case "quiz":
          backgroundColor = Colors.green[200]!;
          iconColor = Colors.green[800]!;
          break;
        default:
          backgroundColor = Colors.grey[200]!;
          iconColor = Colors.grey[800]!;
          break;
      }
    }

    double scale = current
        ? 0.9
        : complete
            ? 0.7
            : 0.8;

    return GestureDetector(
      onTap: () => {},
      child: Transform.scale(
        scale: scale,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                backgroundColor,
                backgroundColor.withOpacity(0.6),
              ],
            ),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
            child: Container(
              width: 250 * scale,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: iconColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Icon(
                        type == "lesson" ? Icons.book : Icons.quiz,
                        size: 80,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  AutoSizeText(
                    "$name - Section $sectionNumber",
                    style: appTheme.textTheme.headline4!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => {},
                    child: Text(
                      "View ",
                      style: TextStyle(
                        color: appTheme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
