import 'dart:io';

import 'package:flutter/foundation.dart';

class MaterialModel {
  final String id;
  final String owner;
  final String name;
  final String? description;
  final List<File> files;
  final String topic;
  final String text;
  final DateTime createdAt;
  final DateTime updatedAt;

  MaterialModel({
    required this.id,
    required this.owner,
    required this.name,
    this.description,
    required this.files,
    required this.topic,
    required this.text,
    required this.createdAt,
    required this.updatedAt,
  });

  //Default constructor
  MaterialModel.empty()
      : id = "",
        owner = "",
        name = "",
        description = "",
        files = [],
        topic = "",
        text = "",
        createdAt = DateTime.now(),
        updatedAt = DateTime.now();

  factory MaterialModel.fromJson(Map<String, dynamic> json) {
    return MaterialModel(
      id: json['_id'],
      owner: json['owner'],
      name: json['name'],
      description: json['description'],
      files: //Check if files is null
          json['files'] == null
              ? []
              : List<File>.from(json['files'].map((x) => File(x))),
      topic: json['topic'],
      text: json['text'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'owner': owner,
      'name': name,
      'description': description,
      'files': files,
      'topic': topic,
      'text': text,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
