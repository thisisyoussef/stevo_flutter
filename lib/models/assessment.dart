import 'package:stevo_flutter/models/question.dart';

class Assessment {
  final String name;
  final String id;
  final String subject;
  int totalAttempts;
  double lastScore;
  final String difficulty;
  final int numberOfQuestions;
  final List<MCQ> questions;

  Assessment(
      {required this.name,
      required this.id,
      required this.subject,
      required this.totalAttempts,
      required this.lastScore,
      required this.difficulty,
      required this.numberOfQuestions,
      required this.questions});

  //Create empty test:
  factory Assessment.empty() {
    return Assessment(
        name: '',
        id: '',
        subject: '',
        totalAttempts: 0,
        lastScore: 0,
        difficulty: '',
        numberOfQuestions: 0,
        questions: []);
  }

  //Create test from json while accounting for fields that may not be present except for name and id
  factory Assessment.fromJson(Map<String, dynamic> json) {
    return Assessment(
        name: json['name'],
        id: json['_id'],
        subject: json['subject'] ?? '',
        totalAttempts: json['totalAttempts'] ?? 0,
        lastScore: json['lastScore'] ?? 0,
        difficulty: json['difficulty'] ?? '',
        numberOfQuestions: json['numberOfQuestions'] ?? 0,
        //Use fromJson method in question.dart to convert json to question:
        questions: List<MCQ>.from(
            json['questions'].map((question) => MCQ.fromJson(question))));
  }

  //Convert test to json
  Map<String, dynamic> toJson() => {
        'name': name,
        '_id': id,
        'subject': subject,
        'totalAttempts': totalAttempts,
        'lastScore': lastScore,
        'difficulty': difficulty,
        'numberOfQuestions': numberOfQuestions,
        'questions': questions
      };
}
