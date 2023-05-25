import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stevo_flutter/models/question.dart';
import 'package:stevo_flutter/widgets/buttons/customButton.dart';
import '../../models/test.dart';
import 'package:stevo_flutter/widgets/mcqBox.dart';

@RoutePage()
class TakingTestScreen extends StatefulWidget {
  TakingTestScreen({super.key, required this.test});

  final Test test;

  @override
  State<TakingTestScreen> createState() => _TakingTestScreenState();
}

class _TakingTestScreenState extends State<TakingTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.test.name),
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
                      widget.test.name,
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
                                widget.test.subject,
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
                                widget.test.difficulty,
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
                                widget.test.numberOfQuestions.toString(),
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
                                "Time Placeholder",
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
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MCQBox(
                      question: MCQ(
                        correctOption: 1,
                        question: "Question",
                        id: "1",
                        options: [
                          "Option 1",
                          "Option 2",
                          "Option 3",
                          "Option 4",
                        ],
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
