//Splash Screen for Stevo Flutter, displays the logo and creates a bouncing animation.
//It then loads the home screen after 3 seconds.

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stevo_flutter/functions/isLoggedIn.dart';
import 'package:stevo_flutter/router.gr.dart';
import 'package:stevo_flutter/screens/homeScreen.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  static const String id = 'splash_screen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

//State for the splash screen
class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  Future<void> checkUserLogin() async {
    // Retrieve other user information if needed

    if (await isLoggedIn() == true) {
      // User is logged in, navigate to the home screen
      //Dispose of the animation controller first
      context.router.replace(HomeRoute());
    } else {
      // User is not logged in, navigate to the login screen
      //Dispose of the animation controller first
      context.router.replace(LoginRoute());
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 3), //3 second animation
      vsync: this,
    );
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
    _controller.forward(); //Start the animation
    _controller.addListener(() {
      setState(() {
        //After ending the animation, reverse it
        if (_controller.status == AnimationStatus.completed) {
          _controller.reverse();
        }
        //After reversing the animation, forward it
        else if (_controller.status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
    });
    //After 3 seconds, navigate to the home screen
    Future.delayed(Duration(seconds: 3), () async {
      await checkUserLogin();
      //Navigate here
    });
  }

  @override
  void dispose() {
    //Dispose of the animation controller
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Display the logo and animate it
      body: Center(
        child: Transform.scale(
          scale: _animation.value * 2,
          child: Icon(
            Icons.book,
            size: 100,
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}
