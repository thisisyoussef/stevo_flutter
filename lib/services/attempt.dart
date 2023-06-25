import 'dart:convert';

import 'package:stevo_flutter/data/sharedPreferences.dart';
import 'package:http/http.dart' as http;
import 'package:stevo_flutter/models/attempt.dart';

Future<dynamic> createAttempt(String assessmentId) async {
  String token = await getToken();
  final url =
      Uri.parse('https://exquizite-prod.herokuapp.com/attempts/$assessmentId');
  final response = await http.post(url, headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer $token',
  });
  if (response.statusCode == 201) {
    //convert the reponse to an attempt object and return it using the fromJson method
    print(jsonDecode(response.body));
    return Attempt.fromJson(jsonDecode(response.body));
    // Handle success
  } else {
    // Handle error
    print(response.body);
    return false;
  }
}

//getAttempt
Future<dynamic> getAttempt(String id) async {
  String token = await getToken();
  final url = Uri.parse('https://exquizite-prod.herokuapp.com/attempt/$id');
  final response = await http.post(url, headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer $token',
  });
  if (response.statusCode == 200) {
    //convert the reponse to an assessment object and return it using the fromJson method
    print(jsonDecode(response.body));
    return Attempt.fromJson(jsonDecode(response.body));
    // Handle success
  } else {
    // Handle error
    print(response.body);
    return false;
  }
}

//submitAttempt, takes in an assessment id and a 2d array of with the first element being the question id and the second element being the answer
Future<dynamic> submitAttempt(String id, List<List<String>> answers) async {
  String token = await getToken();
  final url =
      Uri.parse('https://exquizite-prod.herokuapp.com/attempt/$id/submit');
  final response = await http.patch(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(answers));
  if (response.statusCode == 200) {
    //convert the reponse to an attempt object and return it using the fromJson method
    print(jsonDecode(response.body));
    return Attempt.fromJson(jsonDecode(response.body));
    // Handle success
  } else {
    // Handle error
    print(response.body);
    return false;
  }
}
