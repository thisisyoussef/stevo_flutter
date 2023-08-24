import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:riverpod/riverpod.dart';
import 'package:stevo_flutter/data/app_theme.dart';
import 'package:stevo_flutter/router.dart';
import 'router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'data/userInfo.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: appTheme,
      routerConfig: AppRouter().config(),
      builder: (context, router) {
        return ChangeNotifierProvider(
          create: (context) => UserInfo(),
          child: LoaderOverlay(
            overlayColor: appTheme.scaffoldBackgroundColor.withOpacity(1.0),
            useDefaultLoading: false,
            overlayWidget: Center(
              child: RotatingStevoSpinner(),
            ),
            child: router!,
          ),
        );
      },
    );
  }
}

class RotatingStevoSpinner extends StatefulWidget {
  @override
  _RotatingStevoSpinnerState createState() => _RotatingStevoSpinnerState();
}

class _RotatingStevoSpinnerState extends State<RotatingStevoSpinner>
    with SingleTickerProviderStateMixin {
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
    return RotationTransition(
      turns: _controller!,
      child: Image.asset(
        "assets/images/stevoSIcon.png",
        width: 200,
      ),
    );
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }
}
