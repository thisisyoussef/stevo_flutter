import 'package:stevo_flutter/services/topic.dart';

class Topic {
  String? id;
  String name;
  String? description;
  String createdBy;
  DateTime createdAt;
  DateTime updatedAt;
  String? subject;
  String? difficulty;
  List<String>? tags;
  bool isPublic;
  List<String> sharedWith;
  String? language;

  Topic({
    this.id,
    required this.name,
    this.description,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    this.subject,
    this.difficulty,
    this.tags,
    required this.isPublic,
    required this.sharedWith,
    this.language,
  });

  //Default constructor
  Topic.empty()
      : id = "",
        name = "",
        description = "",
        createdBy = "",
        createdAt = DateTime.now(),
        updatedAt = DateTime.now(),
        subject = "",
        difficulty = "",
        tags = [],
        isPublic = false,
        sharedWith = [],
        language = "";

  Map<String, dynamic> toJson() {
    print(name);
    return {
      //  '_id': id ?? "",
      "name": name,
      "description": description,
      //'createdBy': createdBy,
      // 'createdAt': createdAt.toIso8601String(),
      // 'updatedAt': updatedAt.toIso8601String(),
      "subject": subject,
      'difficulty': difficulty ?? "",
      //'tags': tags,
      //'isPublic': isPublic,
      //'sharedWith': sharedWith ?? [],
      //'language': language ?? "",
    };
  }

  factory Topic.fromJson(Map<String, dynamic> json) {
    return Topic(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      createdBy: json['createdBy'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      subject: json['subject'],
      difficulty: json['difficulty'],
      tags: List<String>.from(json['tags'] ?? []),
      isPublic: json['isPublic'],
      sharedWith: List<String>.from(json['sharedWith'] ?? []),
      language: json['language'],
    );
  }

  getTopicsFromEndpoint() async {
    return await getTopics();
  }
}
