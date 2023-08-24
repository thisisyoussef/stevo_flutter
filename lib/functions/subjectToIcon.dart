//A function that takes in the name of a subject and returns the corresponding icon.

import 'package:flutter/material.dart';

IconData subjectToIcon(String subject) {
  switch (subject.toLowerCase()) {
    case 'math':
      return Icons.calculate;
    case 'science':
      return Icons.science;
    case 'english':
      return Icons.book;
    case 'history':
      return Icons.history;
    case 'geography':
      return Icons.map;
    case 'computer science':
      return Icons.computer;
    case 'art':
      return Icons.palette;
    case 'music':
      return Icons.music_note;
    case 'pe':
      return Icons.sports_soccer;
    case 'language':
      return Icons.language;
    default:
      return Icons.miscellaneous_services;
  }
}
