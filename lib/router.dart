import 'package:auto_route/auto_route.dart';
import 'package:stevo_flutter/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')      
class AppRouter extends $AppRouter {      
    
  @override      
  List<AutoRoute> get routes => [      
   /// routes go here     
   AutoRoute(page: HomeRoute.page, initial: true),
   AutoRoute(page: TopicRoute.page),
   ];    
 }