import 'package:flutter/material.dart';

class WelcomeDialog extends StatelessWidget {
  const WelcomeDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBulletPoint(
                'Start a new topic to learn or continue an existing one.'),
            _buildBulletPoint('Add your materials to the topic.'),
            _buildBulletPoint(
                'Press the play button and Stevo will automatically create a test for you!'),
            _buildBulletPoint('Take a test to see how much you know!'),
            _buildBulletPoint('Learn more material by adding to your topics.'),
            _buildBulletPoint(
                'Stevo does all the work for you! Just upload your PowerPoint, PDF, or Word Document and Stevo will automatically set you up with a topic.'),
            _buildBulletPoint(
                'Coming soon: Stevo will be able to create guided lessons from your material, just like a personal tutor!'),
          ],
        ),
      ),
    );
  }
}

// Helper method to build each bullet point
Widget _buildBulletPoint(String text) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
          ),
          child: Padding(
            padding: EdgeInsets.all(2.0),
            child: Icon(
              Icons.circle,
              size: 14.0,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(width: 8.0),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    ),
  );
}
