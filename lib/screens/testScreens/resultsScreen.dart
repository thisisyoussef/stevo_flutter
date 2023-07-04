import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stevo_flutter/data/userInfo.dart';
import 'package:stevo_flutter/router.gr.dart';
import 'package:stevo_flutter/widgets/buttons/customButton.dart';

//A Page to display the results of an assessment after submission, loads data from the UserInfo Provider

@RoutePage()
class ResultsScreen extends StatefulWidget {
  const ResultsScreen({super.key});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  @override
  Widget build(BuildContext context) {
    //A page to display the results of an assessment after submission, loads data from the UserInfo Provider,
    //shows the overall score and a breakdown of each question and its score, the attempted answer and the actual answer
    //uses colors to show if the answer was correct or not, uses icons to show if the answer was correct or not,
    //uses beautiful animations to show the score and the breakdown of each question
    //uses beutiful widgets with shadows and rounded corners to show the results
    return Scaffold(
      appBar: AppBar(
        title: Text("Results"),
      ),
      body: Consumer<UserInfo>(
        builder: (context, userInfo, child) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  //show the overall score divided by the total score as a percentage
                  Text(
                    "Score: ${userInfo.currentAttempt.score}/${userInfo.currentAttempt.maxScore} (${userInfo.currentAttempt.score! / userInfo.currentAttempt.maxScore!.toInt() * 100}%)",
                    style: TextStyle(fontSize: 20),
                  ),
                  //show the breakdown of each question and its score, the attempted answer and the actual answer
                  for (var question in userInfo.currentAttempt.questions!)
                    Card(
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(question.question!),
                          ),
                          ListTile(
                            title: Text(
                                "Attempted Answer: ${question.attemptedAnswer}"),
                            trailing:
                                question.attemptedAnswer == question.answer
                                    ? Icon(
                                        Icons.check,
                                        color: Colors.green,
                                      )
                                    : Icon(
                                        Icons.close,
                                        color: Colors.red,
                                      ),
                          ),
                          ListTile(
                            title: Text("Actual Answer: ${question.answer}"),
                          ),
                        ],
                      ),
                    ),
                  SizedBox(
                    height: 20,
                  ),
                  //Try again button, pushes the test overview page
                  CustomButton(
                    text: "Try again",
                    onPressed: () {
                      context.router.push(TestOverviewRoute());
                    },
                    icon: Icons.refresh,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //Back to topic button, pushes the topic overview page
                  CustomButton(
                    text: "Back to topic",
                    onPressed: () {
                      context.router.push(TopicRoute());
                    },
                    icon: Icons.arrow_back,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //Home button, pushes the home page
                  CustomButton(
                    text: "Home",
                    onPressed: () {
                      context.router.push(HomeRoute());
                    },
                    icon: Icons.home,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
