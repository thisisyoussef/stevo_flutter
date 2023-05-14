//A function that takes in the name of a subject and returns the corresponding icon.

import 'package:flutter/material.dart';

IconData subjectToIcon(String subject) {
  switch(subject) {
  case 'Math':
    return Icons.calculate;
  case 'Science':
    return Icons.science;
  case 'English':
    return Icons.book;
  case 'History':
    return Icons.history;
  case 'Geography':
    return Icons.map;
  case 'Computer Science':
    return Icons.computer;
  case 'Art':
    return Icons.palette;
  case 'Music':
    return Icons.music_note;
  case 'PE':
    return Icons.sports_soccer;
  case 'Language':
    return Icons.language;
  default:
    return Icons.miscellaneous_services;
}

}