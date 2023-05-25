import 'package:shared_preferences/shared_preferences.dart';

Future<bool> isLoggedIn() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  // Retrieve other user information if needed

  if (isLoggedIn) {
    return true;
  } else {
    return false;
  }
}
