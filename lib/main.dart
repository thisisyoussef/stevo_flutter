import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:stevo_flutter/app_theme.dart';
import 'package:stevo_flutter/router.dart';
import 'router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: appTheme,
      routerConfig: AppRouter().config(),
      builder: (context, router) {
        return LoaderOverlay(
          overlayColor: appTheme.scaffoldBackgroundColor.withOpacity(1.0),
          useDefaultLoading: false,
          overlayWidget: Center(
            child: RotationTransition(
              turns: _controller!,
              child: Image.asset(
                "assets/images/stevoSIcon.png",
                width: 200,
              ),
            ),
          ),
          child: router!,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }
}
