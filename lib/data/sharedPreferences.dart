import 'package:shared_preferences/shared_preferences.dart';

//Save token to shared preferences
void saveToken(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('token', token);
}

// Retrieve token from shared preferences
Future<String?> getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('token');
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
