import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:stevo_flutter/router.gr.dart';
import 'package:stevo_flutter/services/profileManagement.dart';
import 'package:stevo_flutter/widgets/forms/forgotPasswordForm.dart';

import '../buttons/customButton.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String email = "";
  String password = "";
  String error = "";
  bool forgotPassword = false;
  @override
  Widget build(BuildContext context) {
    return !forgotPassword
        ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
              ),
              //Sign in with google button:
              CustomButton(
                text: "Sign in with Google",
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
              //Error text:
              Text(
                error,
                style: TextStyle(),
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
                  hintStyle: TextStyle(
                      //color: Colors.grey,
                      ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          forgotPassword = true;
                        });
                      },
                      child: Text(
                        "Forgot your password?",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //Forgot password button to the bottom right of the password text field:
              //Push to bottom of the screen:
              SizedBox(
                height: MediaQuery.of(context).size.height / 8,
              ),
              CustomButton(
                text: "Login",
                onPressed: () async {
                  context.loaderOverlay.show();
                  if (await loginUser(email, password)) {
                    context.loaderOverlay.hide();
                    context.router.push(HomeRoute());
                  } else {
                    context.loaderOverlay.hide();
                    print("Login failed");
                    setState(() {
                      error =
                          "Something went wrong. Please make sure your email and password are correct and try again.";
                    });
                  }
                },
                icon: Icons.login,
              ),
            ],
          )
        : ForgotPasswordForm(
            onBack: () {
              setState(() {
                forgotPassword = false;
              });
            },
          );
  }
}

class LoginBanner extends StatelessWidget {
  const LoginBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/images/studentsSmiling.jpg'), //TODO: Change to 'studentsSmiling.jpg'
          fit: BoxFit.cover,
        ),
        color: Colors.blue,
        borderRadius: BorderRadius.only(),
      ),
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: EdgeInsets.only(
          left: 30.0,
          top: MediaQuery.of(context).size.height - 150,
          right: 0,
        ),
        child: Text(
            textAlign: TextAlign.center,
            "Forget the hassle of studying and start learning.",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  blurRadius: 2.0,
                  color: Colors.grey,
                  offset: Offset(1.0, 1.0),
                ),
              ],
              wordSpacing: 2,
              fontSize: 45,
            )),
      ),
    );
  }
}
