import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../models/topic.dart';


@RoutePage()
class TopicScreen extends StatelessWidget {
  TopicScreen({super.key, required this.topic});
  Topic topic;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}