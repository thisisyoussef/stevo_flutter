import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stevo_flutter/data/userInfo.dart';
import 'package:stevo_flutter/models/question.dart';
import 'package:stevo_flutter/widgets/buttons/customButton.dart';
import '../../models/assessment.dart';
import 'package:stevo_flutter/widgets/mcqBox.dart';

@RoutePage()
class TakingTestScreen extends StatefulWidget {
  TakingTestScreen({super.key});

  @override
  State<TakingTestScreen> createState() => _TakingTestScreenState();
}

class _TakingTestScreenState extends State<TakingTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Provider.of<UserInfo>(context, listen: true)
            .currentAssessment
            .name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
            vertical: 50,
          ),
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      Provider.of<UserInfo>(context, listen: true)
                          .currentAssessment
                          .name,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),

                  //Row of Test Info with borders on top and bottom all the way across. Only one row with title and information directly next to each other
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(width: 1.0, color: Colors.grey),
                        bottom: BorderSide(width: 1.0, color: Colors.grey),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //Test Subject
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Text(
                                "Subject",
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                Provider.of<UserInfo>(context, listen: true)
                                    .currentAssessment
                                    .subject,
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        //Test Difficulty
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Text(
                                "Difficulty",
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                Provider.of<UserInfo>(context, listen: true)
                                    .currentAssessment
                                    .difficulty,
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        //Test Number of Questions
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Text(
                                "Number of Questions",
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                Provider.of<UserInfo>(context, listen: true)
                                    .currentAssessment
                                    .questions
                                    .length
                                    .toString(),
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        //Time Limit
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Text(
                                "Time Limit",
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                "Placeholder",
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              //ListView.builder of questions using the MCQ widget. Pass in template MCQ object for each

              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: Provider.of<UserInfo>(context, listen: true)
                    .currentAssessment
                    .questions
                    .length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MCQBox(
                      question: MCQ(
                        answer: Provider.of<UserInfo>(context, listen: true)
                            .currentAssessment
                            .questions[index]
                            .answer,
                        question: Provider.of<UserInfo>(context, listen: true)
                            .currentAssessment
                            .questions[index]
                            .question,
                        id: Provider.of<UserInfo>(context, listen: true)
                            .currentAssessment
                            .questions[index]
                            .id,
                        options: Provider.of<UserInfo>(context, listen: true)
                            .currentAssessment
                            .questions[index]
                            .options,
                      ),
                      onUpdate: () {
                        setState(() {});
                      },
                    ),
                  );
                },
              ),
              CustomButton(text: 'Submit', onPressed: () {}, icon: Icons.check),
            ],
          ),
        ),
      ),
    );
  }
}
