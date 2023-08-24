import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:stevo_flutter/data/app_theme.dart';
import 'package:stevo_flutter/data/userInfo.dart';
import 'package:stevo_flutter/models/assessment.dart';
import 'package:stevo_flutter/router.gr.dart';
import 'package:stevo_flutter/widgets/buttons/customButton.dart';

import '../../utils/navigationUtils.dart';

@RoutePage()
class TestOverviewScreen extends StatelessWidget {
  TestOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            NavigationUtils.popAndPushTopic(context,
                Provider.of<UserInfo>(context, listen: false).currentTopic);
          },
        ),
        title: Text("Test Overview"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Test",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Provider.of<UserInfo>(context, listen: true)
                              .currentAssessment
                              .name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          Provider.of<UserInfo>(context, listen: true)
                              .currentAssessment
                              .difficulty,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Provider.of<UserInfo>(context, listen: true)
                                        .currentAssessment
                                        .difficulty ==
                                    'Hard'
                                ? Colors.red
                                : Provider.of<UserInfo>(context, listen: true)
                                            .currentAssessment
                                            .difficulty ==
                                        'Medium'
                                    ? Colors.orange
                                    : Provider.of<UserInfo>(context,
                                                    listen: true)
                                                .currentAssessment
                                                .difficulty ==
                                            'Easy'
                                        ? Colors.green
                                        : Colors.green,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(Icons.timer, size: 24),
                        SizedBox(width: 8),
                        Text(
                          "Time Allowed",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          "10 minutes",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.question_answer, size: 24),
                        SizedBox(width: 8),
                        Text(
                          "Number of Questions",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          Provider.of<UserInfo>(context, listen: true)
                              .currentAssessment
                              .questions
                              .length
                              .toString(),
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.assessment, size: 24),
                        SizedBox(width: 8),
                        Text(
                          Provider.of<UserInfo>(context, listen: true)
                                      .currentAssessment
                                      .totalAttempts ==
                                  0
                              ? "Attempts"
                              : "Attempts Remaining",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          Provider.of<UserInfo>(context, listen: true)
                                      .currentAssessment
                                      .totalAttempts ==
                                  0
                              ? "Unlimited"
                              : Provider.of<UserInfo>(context, listen: true)
                                  .currentAssessment
                                  .totalAttempts
                                  .toString(),
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    //Difficulty:
                    Row(
                      children: [
                        Icon(Icons.thermostat, size: 24),
                        SizedBox(width: 8),
                        Text(
                          "Difficulty",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          Provider.of<UserInfo>(context, listen: true)
                              .currentAssessment
                              .difficulty,
                          style: TextStyle(
                            fontSize: 16,
                            color: Provider.of<UserInfo>(context, listen: true)
                                        .currentAssessment
                                        .difficulty ==
                                    'Hard'
                                ? Colors.red
                                : Provider.of<UserInfo>(context, listen: true)
                                            .currentAssessment
                                            .difficulty ==
                                        'Medium'
                                    ? Colors.orange
                                    : Provider.of<UserInfo>(context,
                                                    listen: true)
                                                .currentAssessment
                                                .difficulty ==
                                            'Easy'
                                        ? Colors.green
                                        : Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 32),
            Text(
              "Your Performance",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Previous Attempts",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(
                              "Attempt ${index + 1}",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              "80%",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.arrow_forward),
                              onPressed: () {
                                // Navigate to the attempt details screen
                              },
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Best Score",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "90%",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 60),
            Center(
              child: CustomButton(
                text: "Start Test",
                onPressed: () async {
                  context.loaderOverlay.show();
                  if (await Provider.of<UserInfo>(context, listen: false)
                      .startAttempt()) {
                    context.loaderOverlay.hide();
                    context.router.push(TakingTestRoute());
                  } else {
                    context.loaderOverlay.hide();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("You have already attempted this test"),
                      duration: Duration(seconds: 2),
                    ));
                  }
                },
                icon: Icons.play_arrow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
