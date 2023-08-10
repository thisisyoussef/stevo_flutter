import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:stevo_flutter/data/sharedPreferences.dart';
import 'package:stevo_flutter/data/userInfo.dart';
import 'package:stevo_flutter/models/topic.dart';
import 'package:stevo_flutter/models/material.dart';
import '../utils/constants.dart';
import '../data/userInfo.dart';

//Add a material to a topic with text only
Future<bool> uploadMaterialText(
    String topicId, String name, String description, String content) async {
  print('uploadMaterialText called');
  String? token = await getToken();
  final url = Uri.parse(
      'https://exquizite-prod.herokuapp.com/topics/$topicId/materials');
  final response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(<String, String>{
      'name': name,
      'description': description,
      'text': content,
    }),
  );
  if (response.statusCode == 201) {
    print('uploadMaterialText successful');
    return true;
  } else {
    final error = jsonDecode(response.body)['error'];
    print(error);
    return false;
  }
}

//upload a material to a topic with file(s)
Future<bool> uploadMaterialFiles(
    String topicId, String name, String description, List<File> files) async {
  //blank for now
  return false;
}

//get All Materials of a topic:
Future<dynamic> getMaterialsOfTopic(String id) async {
  String? token = await getToken();
  final url =
      Uri.parse('https://exquizite-prod.herokuapp.com/topics/$id/materials');
  final response = await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    print('getMaterialsOfTopic successful');
    final materials = jsonDecode(response.body);
    List<MaterialModel> materialList = [];
    for (var material in materials) {
      materialList.add(MaterialModel.fromJson(material));
    }
    print(materialList);
    return materialList;
  } else {
    final error = jsonDecode(response.body)['error'];
    print(error);
    return false;
  }
}

//Delete a material by id
Future<dynamic> deleteMaterial(String id) async {
  String? token = await getToken();
  final url = Uri.parse('https://exquizite-prod.herokuapp.com/materials/$id');
  final response = await http.delete(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    },
  );
  if (response.statusCode == 200) {
    print('deleteMaterial successful');
    return true;
  } else {
    final error = jsonDecode(response.body)['error'];
    print(error);
    return false;
  }
}
