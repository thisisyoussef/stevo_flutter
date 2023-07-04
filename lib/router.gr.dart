// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;
import 'package:stevo_flutter/screens/attemptScreens/allTestAttemptsScreen.dart'
    as _i5;
import 'package:stevo_flutter/screens/homeScreen.dart' as _i4;
import 'package:stevo_flutter/screens/loginScreen.dart' as _i8;
import 'package:stevo_flutter/screens/splashScreen.dart' as _i7;
import 'package:stevo_flutter/screens/testScreens/resultsScreen.dart' as _i3;
import 'package:stevo_flutter/screens/testScreens/takingTestScreen.dart' as _i1;
import 'package:stevo_flutter/screens/testScreens/testOverviewScreen.dart'
    as _i2;
import 'package:stevo_flutter/screens/topicScreen/topicScreen.dart' as _i6;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    TakingTestRoute.name: (routeData) {
      final args = routeData.argsAs<TakingTestRouteArgs>(
          orElse: () => const TakingTestRouteArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.TakingTestScreen(key: args.key),
      );
    },
    TestOverviewRoute.name: (routeData) {
      final args = routeData.argsAs<TestOverviewRouteArgs>(
          orElse: () => const TestOverviewRouteArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.TestOverviewScreen(key: args.key),
      );
    },
    ResultsRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ResultsScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomeScreen(),
      );
    },
    AllTestAttemptsRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.AllTestAttemptsScreen(),
      );
    },
    TopicRoute.name: (routeData) {
      final args = routeData.argsAs<TopicRouteArgs>(
          orElse: () => const TopicRouteArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.TopicScreen(key: args.key),
      );
    },
    SplashRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.SplashScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.LoginScreen(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.TakingTestScreen]
class TakingTestRoute extends _i9.PageRouteInfo<TakingTestRouteArgs> {
  TakingTestRoute({
    _i10.Key? key,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          TakingTestRoute.name,
          args: TakingTestRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'TakingTestRoute';

  static const _i9.PageInfo<TakingTestRouteArgs> page =
      _i9.PageInfo<TakingTestRouteArgs>(name);
}

class TakingTestRouteArgs {
  const TakingTestRouteArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'TakingTestRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.TestOverviewScreen]
class TestOverviewRoute extends _i9.PageRouteInfo<TestOverviewRouteArgs> {
  TestOverviewRoute({
    _i10.Key? key,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          TestOverviewRoute.name,
          args: TestOverviewRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'TestOverviewRoute';

  static const _i9.PageInfo<TestOverviewRouteArgs> page =
      _i9.PageInfo<TestOverviewRouteArgs>(name);
}

class TestOverviewRouteArgs {
  const TestOverviewRouteArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'TestOverviewRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.ResultsScreen]
class ResultsRoute extends _i9.PageRouteInfo<void> {
  const ResultsRoute({List<_i9.PageRouteInfo>? children})
      : super(
          ResultsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResultsRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i5.AllTestAttemptsScreen]
class AllTestAttemptsRoute extends _i9.PageRouteInfo<void> {
  const AllTestAttemptsRoute({List<_i9.PageRouteInfo>? children})
      : super(
          AllTestAttemptsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AllTestAttemptsRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i6.TopicScreen]
class TopicRoute extends _i9.PageRouteInfo<TopicRouteArgs> {
  TopicRoute({
    _i10.Key? key,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          TopicRoute.name,
          args: TopicRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'TopicRoute';

  static const _i9.PageInfo<TopicRouteArgs> page =
      _i9.PageInfo<TopicRouteArgs>(name);
}

class TopicRouteArgs {
  const TopicRouteArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'TopicRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.SplashScreen]
class SplashRoute extends _i9.PageRouteInfo<void> {
  const SplashRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.LoginScreen]
class LoginRoute extends _i9.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i10.Key? key,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i9.PageInfo<LoginRouteArgs> page =
      _i9.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}
