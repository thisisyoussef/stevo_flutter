import 'package:flutter/material.dart';
import 'package:stevo_flutter/data/app_theme.dart';

class DifficultyButton extends StatelessWidget {
  DifficultyButton({
    super.key,
    required this.difficulty,
    required this.onPressed,
    required this.isSelected,
  });

  String difficulty;
  VoidCallback onPressed;
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          onPrimary: Colors.black,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: appTheme.primaryColor.withOpacity(0.5)),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(children: [
            Icon(
              difficulty == 'Hard'
                  ? Icons.battery_full
                  : difficulty == 'Medium'
                      ? Icons.battery_3_bar
                      : difficulty == 'Easy'
                          ? Icons.battery_1_bar
                          : Icons.battery_1_bar,
              size: 20,
              color: !isSelected
                  ? Colors.grey
                  : difficulty == 'Hard'
                      ? Colors.red
                      : difficulty == 'Medium'
                          ? Colors.orange
                          : difficulty == 'Easy'
                              ? Colors.green
                              : Colors.green,
            ),
            Text(
              difficulty == 'Hard'
                  ? 'Hard'
                  : difficulty == 'Medium'
                      ? 'Medium'
                      : difficulty == 'Easy'
                          ? 'Easy'
                          : 'Easy',
            ),
          ]),
        ));
  }
}
