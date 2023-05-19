// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:stevo_flutter/models/topic.dart' as _i6;
import 'package:stevo_flutter/screens/homeScreen.dart' as _i1;
import 'package:stevo_flutter/widgets/dialogBoxes/materials/addMaterialsDialog.dart'
    as _i3;
import 'package:stevo_flutter/screens/topicScreen/topicScreen.dart' as _i2;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomeScreen(),
      );
    },
    TopicRoute.name: (routeData) {
      final args = routeData.argsAs<TopicRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.TopicScreen(
          key: args.key,
          topic: args.topic,
        ),
      );
    },
    AddMaterialsRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.AddMaterialsDialog(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.TopicScreen]
class TopicRoute extends _i4.PageRouteInfo<TopicRouteArgs> {
  TopicRoute({
    _i5.Key? key,
    required _i6.Topic topic,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          TopicRoute.name,
          args: TopicRouteArgs(
            key: key,
            topic: topic,
          ),
          initialChildren: children,
        );

  static const String name = 'TopicRoute';

  static const _i4.PageInfo<TopicRouteArgs> page =
      _i4.PageInfo<TopicRouteArgs>(name);
}

class TopicRouteArgs {
  const TopicRouteArgs({
    this.key,
    required this.topic,
  });

  final _i5.Key? key;

  final _i6.Topic topic;

  @override
  String toString() {
    return 'TopicRouteArgs{key: $key, topic: $topic}';
  }
}

/// generated route for
/// [_i3.AddMaterialsDialog]
class AddMaterialsRoute extends _i4.PageRouteInfo<void> {
  const AddMaterialsRoute({List<_i4.PageRouteInfo>? children})
      : super(
          AddMaterialsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddMaterialsRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
