import 'package:shared_preferences/shared_preferences.dart';
import 'package:stevo_flutter/services/profileManagement.dart';

import '../models/user.dart';

//return user object based on shared preferences
Future<User> getUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String id = prefs.getString('id')!;
  String name = prefs.getString('name')!;
  String email = prefs.getString('email')!;
  String role = prefs.getString('role')!;
  String lastName = prefs.getString('lastName')!;
  return User(
      id: id, firstName: name, lastName: lastName, email: email, role: role);
}

//All purpose log out function
Future<User> logout() async {
  logoutUser(await getToken());
  deleteToken();
  deleteEmail();
  deleteRole();
  saveIsLoggedIn(false);

  return User(
    id: "",
    firstName: "",
    lastName: "",
    email: "",
    role: "",
  );
  //Call service to log out user from server
}

void saveLastName(String lastName) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('lastName', lastName);
}

Future<String?> getLastName() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('lastName');
}

void deleteLastName() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('lastName');
}

void saveName(String name) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('name', name);
}

Future<String?> getName() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('name');
}

void deleteName() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('name');
}

void saveId(String id) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('id', id);
}

Future<String?> getId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('id');
}

void deleteId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('id');
}

//Save token to shared preferences
void saveToken(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('token', token);
}

// Retrieve token from shared preferences
Future<String> getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('token')!;
}

// Delete token from shared preferences
void deleteToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('token');
}

// Save email to shared preferences
void saveEmail(String email) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('email', email);
}

// Retrieve email from shared preferences
Future<String?> getEmail() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('email');
}

// Delete email from shared preferences
void deleteEmail() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('email');
}

//Save role to shared preferences
void saveRole(String role) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('role', role);
}

// Retrieve role from shared preferences
Future<String?> getRole() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('role');
}

// Delete role from shared preferences
void deleteRole() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('role');
}

//Save if user is logged in to shared preferences
void saveIsLoggedIn(bool isLoggedIn) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('isLoggedIn', isLoggedIn);
}
