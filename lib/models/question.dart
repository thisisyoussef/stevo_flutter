class Question {
  String? question;
  String? id;
  String? answer;

  Question({required this.question, required this.id, required this.answer});

  //Factory question fromJSON with just question and id and answer
  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
        question: json['question'], id: json['_id'], answer: json['answer']);
  }

  //Convert question to json
  Map<String, dynamic> toJson() =>
      {'question': question, '_id': id, 'answer': answer};
}

class MCQ extends Question {
  List<String> options;

  MCQ({
    required this.options,
    String? question,
    String? id,
    String? answer,
  }) : super(question: question, id: id, answer: answer);

  //Create empty MCQ:
  factory MCQ.empty() {
    return MCQ(options: [], answer: '', question: '', id: '');
  }

  //Create MCQ from json while accounting for fields that may not be present except for options, answer, question, and id
  factory MCQ.fromJson(Map<String, dynamic> json) {
    return MCQ(
        options: List<String>.from(json['options']),
        answer: json['answer'],
        question: json['question'],
        id: json['_id']);
  }

  //Convert MCQ to json
  Map<String, dynamic> toJson() =>
      {'options': options, 'answer': answer, 'question': question, '_id': id};
}
