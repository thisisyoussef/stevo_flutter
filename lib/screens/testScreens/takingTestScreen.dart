import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:stevo_flutter/data/userInfo.dart';
import 'package:stevo_flutter/models/question.dart';
import 'package:stevo_flutter/router.gr.dart';
import 'package:stevo_flutter/widgets/buttons/customButton.dart';
import 'package:stevo_flutter/widgets/mcqBox.dart';

@RoutePage()
class TakingTestScreen extends StatefulWidget {
  TakingTestScreen({super.key});

  @override
  State<TakingTestScreen> createState() => _TakingTestScreenState();
}

class _TakingTestScreenState extends State<TakingTestScreen> {
  //This list should be populated with the question id in the first index and the answer in the second index
  List<List<String>> answers = [];
  //populate answers with the question id and empty answer
  void populateAnswers() {
    setState(() {
      context.loaderOverlay.show();
      //resizes the answers list to the number of questions in the assessment,
      //The array should be the size of the number of questions in the assessment
      //Inside each array should be an array with a size of 2, the first index is the question id, the second index is the answer
      answers = List.generate(
          Provider.of<UserInfo>(context, listen: false)
              .currentAssessment
              .questions
              .length,
          (index) => [
                Provider.of<UserInfo>(context, listen: false)
                    .currentAssessment
                    .questions[index]
                    .id!,
                ""
              ]);

      //print out the whole list of answers and their question ids
      print(answers);
    });
    context.loaderOverlay.hide();
  }

  @override
  void initState() {
    populateAnswers();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Provider.of<UserInfo>(context, listen: false)
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Provider.of<UserInfo>(context, listen: false)
                    .currentAssessment
                    .name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildInfoItem(
                      'Subject',
                      Provider.of<UserInfo>(context, listen: false)
                          .currentAssessment
                          .subject),
                  _buildInfoItem(
                      'Difficulty',
                      Provider.of<UserInfo>(context, listen: false)
                          .currentAssessment
                          .difficulty),
                  _buildInfoItem(
                      'Number of Questions',
                      Provider.of<UserInfo>(context, listen: false)
                          .currentAssessment
                          .questions
                          .length
                          .toString()),
                  _buildInfoItem('Time Limit', '60 mins'),
                ],
              ),
              SizedBox(height: 32),
              Text(
                'Questions',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: Provider.of<UserInfo>(context, listen: false)
                    .currentAssessment
                    .questions
                    .length, // Assuming 10 questions
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MCQBox(
                      question: Provider.of<UserInfo>(context, listen: false)
                          .currentAssessment
                          .questions[index], // Replace with actual options
                      onUpdate: (value) {
                        setState(() {
                          print(answers.length);
                          print(Provider.of<UserInfo>(context, listen: false)
                              .currentAssessment
                              .questions[index]
                              .id);
                          //find the index of the question in the answers list via id and update the answer, with print statements to check
                          for (int i = 0; i < answers.length; i++) {
                            print(answers[i][0]);
                            if (answers[i][0] ==
                                Provider.of<UserInfo>(context, listen: false)
                                    .currentAssessment
                                    .questions[index]
                                    .id) {
                              answers[i][1] = value;
                              print("Answer Updated");
                              print(answers[i][0]);
                              print(answers[i][1]);
                            }
                          }
                        });
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 32),
              Center(
                child: CustomButton(
                  text: 'Submit',
                  onPressed: () async {
                    context.loaderOverlay.show();
                    if (await Provider.of<UserInfo>(context, listen: false)
                        .submitAssessment(answers)) {
                      context.loaderOverlay.hide();
                      //Push to results screen
                      context.router.push(ResultsRoute());
                    } else {
                      context.loaderOverlay.hide();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text('Something went wrong! Please try again.')));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
