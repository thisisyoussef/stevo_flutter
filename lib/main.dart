import 'package:flutter/material.dart';
import 'package:stevo_flutter/app_theme.dart';
import 'package:stevo_flutter/router.dart';
import 'router.gr.dart';
import 'package:auto_route/auto_route.dart';

void main() {
  runApp(App());
}
class App extends StatelessWidget {            
  // make sure you don't initiate your router                
  // inside of the build function.                
  final _appRouter = AppRouter();            
            
  @override            
  Widget build(BuildContext context){            
    return MaterialApp.router(         
      theme: appTheme,
      routerConfig: _appRouter.config(),         
         
    );            
  }            
}  