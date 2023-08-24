import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pinput/pinput.dart';
import 'package:stevo_flutter/router.gr.dart';
import 'package:stevo_flutter/services/profileManagement.dart';

import '../../data/app_theme.dart';
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
  bool newPasswordView = false;
  bool codeEntryView = false;
  String resetCode = "";
  String newPassword = "";
  @override
  Widget build(BuildContext context) {
    return newPasswordView
        ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              //Friendly Text explaining what to do:
              Text(
                "Enter your new password below.",
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
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    newPassword = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: "New Password",
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
                text: "Change Password",
                icon: Icons.send,
                onPressed: () async {
                  context.loaderOverlay.show();
                  if (newPassword == "") {
                    setState(() {
                      error = "Please enter a new password";
                    });
                  } else {
                    setState(() {
                      error = "";
                    });
                    if (await resetPassword(email, resetCode, newPassword)) {
                      context.loaderOverlay.hide();
                      //replace with login screen:
                      widget.onBack();
                    } else {
                      setState(() {
                        error = "Email not found";
                      });
                      context.loaderOverlay.hide();
                    }
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
          )
        : !codeEntryView
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  //Friendly Text explaining what to do:
                  Text(
                    "Don't worry! Enter your email below and we'll send you an email with a code to reset your password.",
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
                      context.loaderOverlay.show();
                      if (email == "") {
                        setState(() {
                          error = "Please enter an email";
                        });
                      } else {
                        setState(() {
                          error = "";
                        });
                        if (await forgotPassword(email)) {
                          setState(() {
                            codeEntryView = true;
                          });
                          context.loaderOverlay.hide();
                        } else {
                          setState(() {
                            error = "Email not found";
                          });
                          context.loaderOverlay.hide();
                        }
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
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  //Friendly Text explaining what to do:
                  Text(
                    "Enter the code sent to your email below.",
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
                  Pinput(
                    senderPhoneNumber: email,
                    length: 6,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: true,
                    onCompleted: (resetCode) async {
                      context.loaderOverlay.show();
                      this.resetCode = resetCode;
                      if (await checkResetCode(email, resetCode)) {
                        context.loaderOverlay.hide();
                        setState(() {
                          codeEntryView = false;
                          newPasswordView = true;
                        });
                      } else {
                        context.loaderOverlay.hide();
                        setState(() {
                          error = "Code incorrect";
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
