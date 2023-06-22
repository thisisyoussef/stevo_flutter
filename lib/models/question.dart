class Question {
  String? question;
  String? id;

  Question({required this.question, required this.id});
}

class MCQ extends Question {
  List<String> options;
  String answer;

  MCQ(
      {required this.options,
      required this.answer,
      String? question,
      String? id})
      : super(question: question, id: id);

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
