import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stevo_flutter/data/app_theme.dart';
import 'package:stevo_flutter/widgets/dialogBoxes/dialogBox.dart';
import 'package:stevo_flutter/widgets/listPages/testVerticalListPage.dart';
import 'package:stevo_flutter/widgets/navigationRails/topicNavigationRail.dart';

import '../../data/userInfo.dart';
import '../../models/assessment.dart';
import '../../widgets/listPages/horizontalListPage.dart';

@RoutePage()
class AssessmentOverviewScreen extends StatelessWidget {
  const AssessmentOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Expanded(
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: DialogBox(
                  title: 'Assessments',
                  subtitle: 'A list of all your assessments',
                  contents: Expanded(
                    flex: 1,
                    child: TestVerticalListPage(
                      tests: context.watch<UserInfo>().getAssessments,
                      onRefresh: () {
                        context.read<UserInfo>().getAssessments;
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child:
                    // Progress Overview
                    DialogBox(
                        title: 'Progress Overview',
                        subtitle: 'A summary of your progress',
                        contents: ProgressOverview()),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProgressOverview extends StatelessWidget {
  const ProgressOverview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            LinearProgressIndicator(
              value: 0.7, // example value
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            SizedBox(height: 16.0),
            Text('7 out of 10 assessments completed'),
            SizedBox(height: 32.0),
            Text(
              'Performance Metrics',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildMetric('Average Score', '85%'),
                _buildMetric('Highest Score', '95%'),
                _buildMetric('Lowest Score', '72%'),
              ],
            ),
            SizedBox(height: 32.0),
            Text(
              'Performance by Area',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            _buildArea('Matrices', '90%'),
            _buildArea('Vectors', '88%'),
            _buildArea('Complex Numbers', '78%'),
            SizedBox(height: 32.0),
            Text(
              'Feedback and Recommendations',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Great work on matrices! Consider revisiting complex numbers to improve your score.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 32.0),
            Text(
              'Recommended Resources',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Complex Numbers Guide'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Navigate to resource
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetric(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          value,
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }

  Widget _buildArea(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
