import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stevo_flutter/router.gr.dart';
import 'package:stevo_flutter/widgets/dialogBoxes/materials/addMaterialsDialog.dart';

import '../../customButton.dart';
import '../assessments/createAssessmentDialog.dart';

class MaterialActionsDialogBox extends StatelessWidget {
  const MaterialActionsDialogBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomButton(
          icon: Icons.add,
          text: 'Add Material',
          onPressed: () {
            //Push an Alert Dialog Box that asks the user to choose between uploading a file and uploading text
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AddMaterialsDialog();
              },
            );
            //Navigate to the Add Materials Screen
          },
        ),
        CustomButton(
          text: 'Start Learning',
          icon: Icons.play_arrow,
          onPressed: () {},
        ),
        CustomButton(
          text: 'Test Yourself',
          icon: Icons.assessment,
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CreateAssessmentDialog();
                });
          },
        ),
      ],
    );
  }
}
