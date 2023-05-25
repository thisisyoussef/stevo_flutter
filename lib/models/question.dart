class Question {
  String? question;
  String? id;

  Question({required this.question, required this.id});
}

class MCQ extends Question {
  List<String> options;
  int correctOption;

  MCQ(
      {required this.options,
      required this.correctOption,
      String? question,
      String? id})
      : super(question: question, id: id);
}
