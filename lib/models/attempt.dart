import 'package:stevo_flutter/models/assessment.dart';
import 'package:stevo_flutter/models/question.dart';

class Attempt {
  String id;
  String assessment;
  String user;
  List<MCQ>? questions;
  DateTime? startedAt;
  DateTime? completedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? timeTaken;
  int? score;
  int? maxScore;
  String? language;
  bool? submitted;

  Attempt({
    required this.id,
    required this.assessment,
    required this.user,
    this.questions,
    this.startedAt,
    this.completedAt,
    this.createdAt,
    this.updatedAt,
    this.timeTaken,
    this.score,
    this.maxScore,
    this.language,
    this.submitted,
  });

  //Empty attempt:
  factory Attempt.empty() {
    return Attempt(
      id: '',
      assessment: '',
      user: '',
      questions: [],
      startedAt: null,
      completedAt: null,
      createdAt: null,
      updatedAt: null,
      timeTaken: 0,
      score: 0,
      maxScore: 0,
      language: '',
      submitted: false,
    );
  }

  factory Attempt.fromJson(Map<String, dynamic> json) {
    return Attempt(
      id: json['_id'],
      assessment: json['assessment'],
      user: json['user'],
      questions: json['questions'] != null
          ? List<MCQ>.from(
              json['questions'].map(
                (question) => MCQ.fromJson(question),
              ),
            )
          : null,
      startedAt:
          json['startedAt'] != null ? DateTime.parse(json['startedAt']) : null,
      completedAt: json['completedAt'] != null
          ? DateTime.parse(json['completedAt'])
          : null,
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      timeTaken: json['timeTaken'],
      score: json['score'],
      maxScore: json['maxScore'],
      language: json['language'],
      submitted: json['submitted'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (id != null) {
      data['_id'] = id;
    }
    if (assessment != null) {
      data['assessment'] = assessment;
    }
    if (user != null) {
      data['user'] = user;
    }
    if (questions != null) {
      data['questions'] =
          questions?.map((question) => question.toJson()).toList();
    }
    if (startedAt != null) {
      data['startedAt'] = startedAt?.toIso8601String();
    }
    if (completedAt != null) {
      data['completedAt'] = completedAt?.toIso8601String();
    }
    if (createdAt != null) {
      data['createdAt'] = createdAt?.toIso8601String();
    }
    if (updatedAt != null) {
      data['updatedAt'] = updatedAt?.toIso8601String();
    }
    if (timeTaken != null) {
      data['timeTaken'] = timeTaken;
    }
    if (score != null) {
      data['score'] = score;
    }
    if (maxScore != null) {
      data['maxScore'] = maxScore;
    }
    if (language != null) {
      data['language'] = language;
    }
    if (submitted != null) {
      data['submitted'] = submitted;
    }
    return data;
  }
}
