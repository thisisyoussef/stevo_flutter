import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:stevo_flutter/data/sharedPreferences.dart';
import 'package:stevo_flutter/data/userInfo.dart';
import 'package:stevo_flutter/models/assessment.dart';
import 'package:stevo_flutter/models/topic.dart';
import 'package:stevo_flutter/models/user.dart';
import '../utils/constants.dart';
import '../data/userInfo.dart';
import 'package:redis/redis.dart';

import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

//generateAssessment:
Future<dynamic> generateAssessment(
    String name, int numQuestions, String difficulty, String topicId) async {
  String? token = await getToken();
  final url = Uri.parse(
      'https://exquizite-prod.herokuapp.com/assessments/generateFromTopic/$topicId');
  final response = await http.post(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
        'name': name,
        'numQuestions': numQuestions,
        'difficulty': difficulty,
      }));
  if (response.statusCode == 200) {
    //get jobid from response and print
    final jobId = jsonDecode(response.body)['jobId'];
    print(jobId);
    //call getJob with jobId in a loop. Check status field of response. If status is 'completed', return data field.
    //If status is 'waiting' call getJob again after 2 seconds. If status is 'active' call getJob again after 1 second.
    //If status is 'failed' return false.
    bool jobComplete = false;
    final maxWaitTime = 300; // seconds
    final startTime = DateTime.now().millisecondsSinceEpoch / 1000;

    while (!jobComplete) {
      final jobResponse = await getJob(jobId);

      // check if jobResponse is false, if so return false
      if (jobResponse == false) {
        return false;
      }

      if (jobResponse['status'] == 'completed') {
        jobComplete = true;
        return jobResponse['data'];
      } else if (jobResponse['status'] == 'waiting') {
        await Future.delayed(Duration(seconds: 2));

        // check elapsed time, cancel job if necessary
        final elapsed =
            DateTime.now().millisecondsSinceEpoch / 1000 - startTime;
        if (elapsed >= maxWaitTime) {
          return false;
        }
      } else if (jobResponse['status'] == 'active') {
        await Future.delayed(Duration(seconds: 1));

        // check elapsed time, cancel job if necessary
        final elapsed =
            DateTime.now().millisecondsSinceEpoch / 1000 - startTime;
        if (elapsed >= maxWaitTime) {
          return false;
        }
      } else if (jobResponse['status'] == 'failed') {
        jobComplete = true;
        return false;
      }
    }

    return true;
    // Handle success
  } else {
    // Handle error
    final error = jsonDecode(response.body)['error'];
    print(error);
    return false;
  }
}

Future<dynamic> getJob(String id) async {
  String token = await getToken();
  final url = Uri.parse('https://exquizite-prod.herokuapp.com/jobs/$id');
  final response = await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    },
  );
  if (response.statusCode == 200) {
    //return response
    print(jsonDecode(response.body));
    return jsonDecode(response.body);
    // Handle success
  } else {
    // Handle error
    print(response.body);
    return false;
  }
}

//getAssessment:
Future<dynamic> getAssessment(String id) async {
  String token = await getToken();
  final url = Uri.parse('https://exquizite-prod.herokuapp.com/assessments/$id');
  final response = await http.get(url, headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer $token',
  });
  try {
    if (response.statusCode == 200) {
      //convert the reponse to an assessment object and return it using the fromJson method
      print(jsonDecode(response.body));
      return Assessment.fromJson(jsonDecode(response.body));
      // Handle success
    } else {
      // Handle error
      print(response.body);
      return false;
    }
  } catch (e) {
    print(e);
    return false;
  }
}

//getmyAssessments:
Future<dynamic> getMyAssessments() async {
  print('getMyAssessments called');
  String token = await getToken();
  final url = Uri.parse('https://exquizite-prod.herokuapp.com/myAssessments');
  final response = await http.get(url, headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer $token',
  });
  if (response.statusCode == 200) {
    print("Got my assessments");
    //turn the list of assessments into json and return it
    var assessments = jsonDecode(response.body);
    print("Ready to return");
    //print(assessments);
    //use fromJson to convert the json to a list of assessments
    List<Assessment> assessmentList = [];
    for (var assessment in assessments) {
      assessmentList.add(Assessment.fromJson(assessment));
    }
    return assessmentList;
    // Handle success
  } else {
    // Handle error
    print(response.body);
    return false;
  }
}
