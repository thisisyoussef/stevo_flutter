//This is an mcq box widget that is used to display a full mcq question and its options.
//The widget takes in a Question object and displays the question and its options.
//It also takes in a callback that is called when the user selects an option.

import 'package:flutter/material.dart';
import 'package:stevo_flutter/models/question.dart';

class MCQBox extends StatefulWidget {
  MCQBox({
    Key? key,
    required this.question,
    required this.onUpdate,
    this.viewOnly = false,
    this.correctAnswer,
    this.selectedAnswer,
  }) : super(key: key);

  final MCQ question;
  final Function onUpdate;
  final bool viewOnly;
  final String? correctAnswer;
  final String? selectedAnswer;

  @override
  State<MCQBox> createState() => _MCQBoxState();
}

class _MCQBoxState extends State<MCQBox> {
  int? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.question.question!,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(),
          for (var option in widget.question.options) _buildOption(option),
          if (widget.viewOnly && widget.selectedAnswer != null)
            _buildFeedbackBox(),
        ],
      ),
    );
  }

  Widget _buildOption(String option) {
    if (widget.viewOnly) {
      return ListTile(
        title: Text(
          option,
          style: TextStyle(
            fontSize: 16.0,
            color: _getOptionColor(option),
          ),
        ),
        leading: _buildOptionIcon(option),
      );
    } else {
      return RadioListTile(
        title: Text(
          option,
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        groupValue: selectedOption,
        value: widget.question.options.indexOf(option),
        onChanged: (value) {
          setState(() {
            selectedOption = value;
          });
          String selectedOptionString =
              widget.question.options[selectedOption!];
          widget.onUpdate(selectedOptionString);
        },
      );
    }
  }

  Widget _buildOptionIcon(String option) {
    if (widget.viewOnly) {
      if (option == widget.correctAnswer) {
        return Icon(Icons.check, color: Colors.green);
      } else if (option == widget.selectedAnswer &&
          option != widget.correctAnswer) {
        return Icon(Icons.close, color: Colors.red);
      } else {
        return Icon(Icons.radio_button_unchecked, color: Colors.grey);
      }
    } else {
      return SizedBox.shrink();
    }
  }

  Color _getOptionColor(String option) {
    if (option == widget.correctAnswer) {
      return Colors.green;
    } else if (option == widget.selectedAnswer &&
        option != widget.correctAnswer) {
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }

  Widget _buildFeedbackBox() {
    bool isCorrect = widget.selectedAnswer == widget.correctAnswer;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      color: isCorrect ? Colors.green[100] : Colors.red[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isCorrect ? 'Correct!' : 'Incorrect',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: isCorrect ? Colors.green : Colors.red,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            'Your answer: ${widget.selectedAnswer}',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            'Correct answer: ${widget.correctAnswer}',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 8.0),
          // Add explanation here

          Text(
            'Explanation: ......',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
