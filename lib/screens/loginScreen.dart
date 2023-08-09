//Login screen

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:stevo_flutter/app_theme.dart';
import 'package:stevo_flutter/data/sharedPreferences.dart';
import 'package:stevo_flutter/router.gr.dart';
import 'package:stevo_flutter/widgets/buttons/customButton.dart';
import 'package:stevo_flutter/widgets/forms/loginForm.dart';

import '../widgets/forms/registerForm.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool login = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            LoginBanner(),
            //Row of clickable Sign Up and Login buttons that change the login variable
            Container(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 60.0, left: 50.0, right: 50.0, bottom: 50.0),
                child: Column(
                  children: [
                    //Stevo logo
                    Image.asset(
                      "assets/images/stevoLogo.png",
                      width: 200,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 20.0),
                          child: Row(
                            children: [
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      login = true;
                                    });
                                  },
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      color: login
                                          ? appTheme.primaryColor
                                          : Colors.grey,
                                      fontSize: 30,
                                    ),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      login = false;
                                    });
                                  },
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      color: login
                                          ? Colors.grey
                                          : appTheme.primaryColor,
                                      fontSize: 30,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        login
                            ? LoginForm()
                            : RegisterForm(
                                goToLogin: () {
                                  setState(() {
                                    login = true;
                                  });
                                },
                              ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
