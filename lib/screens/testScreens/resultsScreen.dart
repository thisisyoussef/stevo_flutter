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
  List<dynamic> questions = [];
  List<dynamic> answers = [];
  List<dynamic> userAnswers = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Results"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(40.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.withOpacity(0.7), Colors.white],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            //Display percentage score
            Text(
              "Score:${(Provider.of<UserInfo>(context).currentAttempt.score! / Provider.of<UserInfo>(context).currentAttempt.maxScore!.toDouble() * 100).toStringAsFixed(2)}%",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: Provider.of<UserInfo>(context)
                    .currentAttempt
                    .questions!
                    .length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(Provider.of<UserInfo>(context)
                              .currentAttempt
                              .questions![index]
                              .question ??
                          ""),
                      subtitle: Text(
                          "Your answer: ${Provider.of<UserInfo>(context).currentAttempt.questions![index].attemptedAnswer} Correct answer: ${Provider.of<UserInfo>(context).currentAttempt.questions![index].answer}"),
                      trailing: Provider.of<UserInfo>(context)
                                  .currentAttempt
                                  .questions![index]
                                  .attemptedAnswer ==
                              Provider.of<UserInfo>(context)
                                  .currentAttempt
                                  .questions![index]
                                  .answer
                          ? Icon(Icons.check, color: Colors.green)
                          : Icon(Icons.clear, color: Colors.red),
                      tileColor: Provider.of<UserInfo>(context)
                                  .currentAttempt
                                  .questions![index]
                                  .attemptedAnswer ==
                              Provider.of<UserInfo>(context)
                                  .currentAttempt
                                  .questions![index]
                                  .answer
                          ? Colors.green[50]
                          : Colors.red[50],
                    ),
                  );
                },
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
  }
}
