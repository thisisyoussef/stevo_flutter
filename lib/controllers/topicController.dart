import '../models/topic.dart';

class TopicController {
  final Topic model;

  TopicController({required this.model});

  Future<List<Topic>> getTopics(String endpoint) async {
    return await model.getTopicsFromEndpoint();
  }
}
