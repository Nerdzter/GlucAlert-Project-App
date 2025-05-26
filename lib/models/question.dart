import 'package:flutter/material.dart';

class Question {
  final String key;
  final String question;
  final Widget Function(BuildContext, void Function(dynamic)) builder;
  final bool Function(Map<String, dynamic>)? condition;

  const Question({
    required this.key,
    required this.question,
    required this.builder,
    this.condition,
  });
}