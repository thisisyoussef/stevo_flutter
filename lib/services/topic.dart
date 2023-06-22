import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:stevo_flutter/data/sharedPreferences.dart';
import 'package:stevo_flutter/data/userInfo.dart';
import 'package:stevo_flutter/models/topic.dart';
import 'package:stevo_flutter/models/user.dart';
import '../utils/constants.dart';
import '../data/userInfo.dart';

Future<dynamic> getTopics() async {
  print('getTopics called');
  String? token = await getToken();
  final url = Uri.parse('https://exquizite-prod.herokuapp.com/topics');
  final response = await http.get(
    url,
    headers: <String, String>{
      'Authorization': 'Bearer $token',
    },
  );
  if (response.statusCode == 200) {
    print('getTopics successful');
    //iterate through topics and convert to TopicModel using factory method
    final topics = jsonDecode(response.body)['topics'];
    List<Topic> topicList = [];
    for (var topic in topics) {
      topicList.add(Topic.fromJson(topic));
    }
    //Add topics to provider
    return topicList;
    // Handle success
  } else {
    // Handle error
    final error = jsonDecode(response.body)['error'];
    print(error);
    return false;
  }
}

//createTopic:
Future<dynamic> createTopic(Topic newTopic) async {
  String? token = await getToken();
  final url = Uri.parse('https://exquizite-prod.herokuapp.com/topic');
  final response = await http.post(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(newTopic.toJson()));
  if (response.statusCode == 201) {
    UserInfo().loadTopics();
    return true;
    // Handle success
  } else {
    // Handle error
    final error = jsonDecode(response.body)['error'];
    print(error);
    return false;
  }
}

//Get my topics
Future<dynamic> getMyTopics(Topic newTopic) async {
  String? token = await getToken();
  final url = Uri.parse('https://exquizite-prod.herokuapp.com/topics/me');
  final response = await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    },
  );
  if (response.statusCode == 200) {
    //update UserInfo().myTopics
    final topics = jsonDecode(response.body)['topics'];
    List<Topic> topicList = [];
    for (var topic in topics) {
      topicList.add(Topic.fromJson(topic));
    }
    //
    return true;
    // Handle success
  } else {
    // Handle error
    final error = jsonDecode(response.body)['error'];
    print(error);
    return false;
  }
}

//Get topic by id
Future<dynamic> getTopic(String id) async {
  String? token = await getToken();
  final url = Uri.parse('https://exquizite-prod.herokuapp.com/topics/$id');
  final response = await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    },
  );
  if (response.statusCode == 200) {
    //update UserInfo().myTopics
    final topic = jsonDecode(response.body)['topic'];
    Topic topicModel = Topic.fromJson(topic);
    return topicModel;
    // Handle success
  } else {
    // Handle error
    final error = jsonDecode(response.body)['error'];
    print(error);
    return false;
  }
}
