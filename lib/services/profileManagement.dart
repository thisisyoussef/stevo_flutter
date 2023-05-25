import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stevo_flutter/data/sharedPreferences.dart';
import '../utils/constants.dart';

// Registration
Future<bool> registerUser(String firstName, String lastName, String email,
    String password, String role) async {
  //Use Uri.https() for https instead of Uri.parse()
  final url = Uri.parse('${Constants.apiUrl}/register');
  final response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'role': role,
    }),
  );
  if (response.statusCode == 201) {
    // Handle success
    final user = jsonDecode(response.body)['user'];
    final token = jsonDecode(response.body)['token'];
    role = jsonDecode(response.body)['user']['role'];
    saveToken(token);
    saveEmail(email);
    saveRole(role);
    //Save user information to shared preferences
    saveIsLoggedIn(true);
    return true;
  } else {
    // Handle error
    final error = jsonDecode(response.body)['error'];
    print(error);
    return false;
  }
}

// Login
Future<bool> loginUser(String email, String password) async {
  final url = Uri.parse('https://exquizite-prod.herokuapp.com/login');
  final response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Credentials":
          "true", // Required for cookies, authorization headers with HTTPS
      "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS"
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );
  if (response.statusCode == 200) {
    // Handle success
    final user = jsonDecode(response.body)['user'];
    final token = jsonDecode(response.body)['token'];
    final role = jsonDecode(response.body)['user']['role'];
    saveToken(token);
    saveEmail(email);
    saveRole(role);
    //Save user information to shared preferences
    saveIsLoggedIn(true);
    return true;
  } else {
    print(email);
    print(response.statusCode);
    print(response.body);
    // Handle error
    final error = jsonDecode(response.body)['error'];
    print(error);
    return false;
  }
}

// Logout
Future<void> logoutUser(String token) async {
  final url = Uri.parse('https://exquizite-prod.herokuapp.com/logout');
  final response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    },
  );
  if (response.statusCode == 200) {
    // Handle success
    final message = jsonDecode(response.body)['message'];
  } else {
    // Handle error
    final error = jsonDecode(response.body)['error'];
  }
}

// Logout from all devices
Future<void> logoutAllUser() async {
  final url = Uri.parse('https://exquizite-prod.herokuapp.com/logoutAll');
  String? token = await getToken();
  final response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    },
  );
  if (response.statusCode == 200) {
    // Handle success
    final message = jsonDecode(response.body)['message'];
  } else {
    // Handle error
    final error = jsonDecode(response.body)['error'];
  }
}

// Get profile
Future<void> getUserProfile() async {
  String? token = await getToken();
  final url = Uri.parse('https://exquizite-prod.herokuapp.com/profile');
  final response = await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    },
  );
  if (response.statusCode == 200) {
    // Handle success
    final user = jsonDecode(response.body)['user'];
  } else {
    // Handle error
    final error = jsonDecode(response.body)['error'];
  }
}
