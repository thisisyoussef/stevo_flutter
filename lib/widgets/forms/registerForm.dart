//Register banner

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:stevo_flutter/data/app_theme.dart';

import '../../router.gr.dart';
import '../buttons/customButton.dart';
import 'package:stevo_flutter/services/profileManagement.dart';

class RegisterForm extends StatefulWidget {
  RegisterForm({super.key, required this.goToLogin});

  Function goToLogin;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  String firstName = "";

  String lastName = "";

  String email = "";

  String password = "";

  String role = "student";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        //Sign in with google button:
        CustomButton(
          text: "Sign up with Google",
          onPressed: () {},
          icon: Icons.g_mobiledata,
        ),
        SizedBox(
          height: 20,
        ),
        //Divider with text in the middle:
        Row(
          children: [
            Expanded(
              child: Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "OR",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
            ),
            Expanded(
              child: Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        //First and last name text fields:
        TextField(
          onChanged: (value) {
            setState(() {
              firstName = value;
            });
          },
          decoration: InputDecoration(
            hintText: "First Name",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TextField(
          onChanged: (value) {
            setState(() {
              lastName = value;
            });
          },
          decoration: InputDecoration(
            hintText: "Last Name",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        //Email and password text fields:
        TextField(
          onChanged: (value) {
            setState(() {
              email = value;
            });
          },
          decoration: InputDecoration(
            hintText: "Email",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TextField(
          onChanged: (value) {
            setState(() {
              password = value;
            });
          },
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Confirm Password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        //Pick between a student role or a teacher:
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "I am a ",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            DropdownButton<String>(
              value: role,
              icon: null,
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.grey),
              underline: Container(
                height: 2,
                color: Colors.grey,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  role = newValue!;
                });
              },
              items: <String>['student', 'teacher']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),

        //Sign up button:
        CustomButton(
          text: "Sign Up",
          onPressed: () async {
            context.loaderOverlay.show();
            if (await registerUser(
                firstName, lastName, email, password, role)) {
              context.loaderOverlay.hide();
              context.router.push(HomeRoute());
            } else {
              context.loaderOverlay.hide();
              print("Error");
            }
          },
          icon: Icons.login,
        ),
        SizedBox(
          height: 20,
        ),
        //Pick between a student role or a teacher:

        //Text that says "Already have an account? Sign in"
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Already have an account? ",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            TextButton(
              onPressed: () {
                widget.goToLogin();
              },
              child: Text(
                "Sign in",
                style: TextStyle(
                  color: appTheme.primaryColor,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
