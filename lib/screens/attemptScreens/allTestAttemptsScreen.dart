import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stevo_flutter/app_theme.dart';
import 'package:stevo_flutter/data/userInfo.dart';
import 'package:stevo_flutter/widgets/buttons/customButton.dart';

@RoutePage()
class AllTestAttemptsScreen extends StatelessWidget {
  const AllTestAttemptsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Provider.of<UserInfo>(context).currentTopic.name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  Provider.of<UserInfo>(context).currentAssessment.name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: Provider.of<UserInfo>(context).getAttempts.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text("Score: " +
                          Provider.of<UserInfo>(context)
                              .getAttempts[index]
                              .score
                              .toString() +
                          "/" +
                          Provider.of<UserInfo>(context)
                              .getAttempts[index]
                              .maxScore
                              .toString()),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Date Taken:" +
                              Provider.of<UserInfo>(context)
                                  .getAttempts[index]
                                  .completedAt
                                  .toString()),
                          Text("Time Taken: " +
                              Provider.of<UserInfo>(context)
                                  .getAttempts[index]
                                  .timeTaken
                                  .toString()),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.remove_red_eye,
                            color: appTheme.primaryColor),
                        onPressed: () {},
                        color: appTheme.primaryColor,
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                onPressed: () {},
                text: "Take Test",
                icon: Icons.play_arrow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
