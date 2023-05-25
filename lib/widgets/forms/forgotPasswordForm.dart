import 'package:flutter/material.dart';

import '../buttons/customButton.dart';

//Forgot password form
class ForgotPasswordForm extends StatefulWidget {
  ForgotPasswordForm({
    super.key,
    required this.onBack,
  });

  Function onBack;

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  String email = "";
  String error = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        //Friendly Text explaining what to do:
        Text(
          "Don't worry! Enter your email below and we'll send you an email with a link to reset your password.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
          ),
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
        //Login button:
        CustomButton(
          text: "Send reset email",
          icon: Icons.send,
          onPressed: () async {
            if (email == "") {
              setState(() {
                error = "Please enter an email";
              });
            } else {
              setState(() {
                error = "";
              });
            }
          },
        ),
        SizedBox(
          height: 20,
        ),
        //Back button:
        CustomButton(
          text: "Back",
          icon: Icons.arrow_back,
          onPressed: () {
            widget.onBack();
          },
        ),
      ],
    );
  }
}
