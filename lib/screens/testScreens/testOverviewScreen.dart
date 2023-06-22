import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stevo_flutter/app_theme.dart';
import 'package:stevo_flutter/data/userInfo.dart';
import 'package:stevo_flutter/models/assessment.dart';
import 'package:stevo_flutter/router.gr.dart';
import 'package:stevo_flutter/widgets/buttons/customButton.dart';

@RoutePage()
class TestOverviewScreen extends StatelessWidget {
  TestOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Test Overview",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.25, vertical: 50),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Icon to signify that the test is ready to be taken
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Icon(Icons.check_circle_outline,
                            size: 100, color: appTheme.primaryColor),
                        Text("Your test is ready!",
                            style: TextStyle(fontSize: 40)),
                        Text(
                            "Your customized test has been successfully generated.",
                            style: TextStyle(fontSize: 20, color: Colors.grey)),
                      ],
                    ),
                  ),
                ),
              ),
              //Test Name

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
                          color: Colors.black)),
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
                                  : Provider.of<UserInfo>(context, listen: true)
                                              .currentAssessment
                                              .difficulty ==
                                          'Easy'
                                      ? Colors.green
                                      : Colors.green))
                ],
              ),
              Column(
                children: [
                  InfoTile(
                      iconData: Icons.timer,
                      text: "Time Allowed",
                      value: "10 minutes"),
                  SizedBox(
                    height: 10,
                  ),
                  InfoTile(
                      iconData: Icons.question_answer,
                      text: "Number of Questions",
                      value: Provider.of<UserInfo>(context, listen: true)
                          .currentAssessment
                          .questions
                          .length
                          .toString()),
                  SizedBox(
                    height: 10,
                  ),
                  InfoTile(
                      iconData: Icons.assessment,
                      text: //Attempts,
                          Provider.of<UserInfo>(context, listen: true)
                                      .currentAssessment
                                      .totalAttempts ==
                                  0
                              ? "Attempts"
                              : "Attempts Remaining",
                      value: Provider.of<UserInfo>(context, listen: true)
                                  .currentAssessment
                                  .totalAttempts ==
                              0
                          ? "Unlimited"
                          : Provider.of<UserInfo>(context, listen: true)
                              .currentAssessment
                              .totalAttempts
                              .toString()),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                  text: "Start Test",
                  onPressed: () {
                    context.router.push(TakingTestRoute());
                  },
                  icon: Icons.play_arrow)
            ]),
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  InfoTile(
      {super.key,
      required this.iconData,
      required this.text,
      required this.value});
  IconData iconData;
  String text;
  String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.all(Radius.circular(2)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 10,
          ),
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.transparent),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Icon(
              iconData,
              size: 30,
              shadows: [
                Shadow(
                  blurRadius: 2.0,
                  color: Colors.grey,
                  offset: Offset(1.0, 1.0),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text),
              Text(value, style: TextStyle(fontSize: 15, color: Colors.grey))
            ],
          ),
        ],
      ),
    );
  }
}
