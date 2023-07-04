import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:stevo_flutter/models/assessment.dart';
import 'package:stevo_flutter/models/topic.dart';
import 'package:stevo_flutter/router.gr.dart';
import '../data/userInfo.dart';
import 'package:stevo_flutter/services/topic.dart';

class NavigationUtils {
  static Future<void> pushWithTask(
      BuildContext context, PageRouteInfo screen, Function task) async {
    // Perform your additional tasks here before pushing to a new screen
    task();

    //Use AutoRoute to push to a new screen
    await AutoRouter.of(context).push(screen);
  }

  //pushAndPopWithTask
  static Future<void> pushAndPopWithTask(
      BuildContext context, PageRouteInfo screen, Function task) async {
    // Perform your additional tasks here before pushing to a new screen
    task();

    //Use AutoRoute to push to a new screen
    await AutoRouter.of(context)
        .pushAndPopUntil(screen, predicate: (_) => false);
  }

  //replaceWithTask
  static Future<void> replaceWithTask(
      BuildContext context, PageRouteInfo screen, Function task) async {
    // Perform your additional tasks here before pushing to a new screen
    task();

    //Use AutoRoute to push to a new screen
    await AutoRouter.of(context).replace(screen);
  }

  //pushHome
  static Future<void> pushAndLoadHome(BuildContext context) async {
    //Update UserInfo Provider
    //UserInfo().user = null;
    getTopics();
    //Use AutoRoute to push to a new screen
    await AutoRouter.of(context).pushAndPopUntil(
      HomeRoute(),
      predicate: (_) => false,
    );
  }

  //replaceAndPushHome
  static Future<void> replaceAndPushHome(BuildContext context) async {
    //Update UserInfo Provider
    //UserInfo().user = null;
    //getTopics();
    //Use AutoRoute to push to a new screen
    context.loaderOverlay.show();
    Provider.of<UserInfo>(context, listen: false).loadTopics();
    Provider.of<UserInfo>(context, listen: false).loadAssessments();
    context.loaderOverlay.hide();
    await AutoRouter.of(context).replace(HomeRoute());
  }

  //pushAndLoadTestOverview
  static Future<void> pushAndLoadTestOverview(
      BuildContext context, String assessmentId) async {
    //Update UserInfo Provider
    //UserInfo().user = null;
    //getTopics();
    //Use AutoRoute to push to a new screen
    context.loaderOverlay.show();
    Provider.of<UserInfo>(context, listen: false).loadTest(assessmentId);
    context.loaderOverlay.hide();
    await AutoRouter.of(context).push(TestOverviewRoute());
  }

  //pushAndSetAttemptsForTest
  static Future<void> pushAndSetAttemptsForTest(
      BuildContext context, Assessment assessment, String topicId) async {
    context.loaderOverlay.show();
    Provider.of<UserInfo>(context, listen: false).setCurrentTest(assessment);
    //set current topic
    Provider.of<UserInfo>(context, listen: false).setCurrentTopicById(topicId);
    //load attempts
    await Provider.of<UserInfo>(context, listen: false)
        .loadAttemptsByAssessmentId(assessment.id);
    context.loaderOverlay.hide();
    await AutoRouter.of(context).push(AllTestAttemptsRoute());
  }
}
