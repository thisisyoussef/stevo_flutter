import 'dart:io';

import 'package:flutter/material.dart';

Widget materialContentBox(File file) {
  String extension = file.path.split('.').last.toLowerCase();
  String fileName = file.path.split('/').last;

  IconData iconData;
  Color iconColor;
  if (extension == 'jpg' ||
      extension == 'jpeg' ||
      extension == 'png' ||
      extension == 'gif') {
    iconData = Icons.image;
    iconColor = Colors.blue.withOpacity(0.5);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          Image.file(
            file,
            fit: BoxFit.fitWidth,
          ),
          //Icon overlay:
          Align(
            alignment: Alignment.center,
            child: Container(
              child: Icon(
                iconData,
                size: 64,
                color: iconColor,
              ),
            ),
          ),
        ],
      ),
    );
  } else {
    switch (extension) {
      case 'mp4':
      case 'avi':
      case 'mov':
      case 'wmv':
        iconData = Icons.video_library;
        iconColor = Colors.red;
        break;
      case 'mp3':
      case 'wav':
      case 'aac':
      case 'flac':
        iconData = Icons.audiotrack;
        iconColor = Colors.green;
        break;
      //powerpoint and similar case:
      case 'ppt':
      case 'pptx':
      case 'pps':
      case 'ppsx':
        iconData = Icons.slideshow;
        iconColor = Colors.orange;
        break;
      case 'doc':
      case 'docx':
      case 'odt':
        iconData = Icons.description;
        iconColor = Colors.blue;
        break;
      case 'xls':
      case 'xlsx':
      case 'ods':
      case 'csv':
      case 'tsv':
        iconData = Icons.table_chart;
        iconColor = Colors.green;
        break;
      case 'pdf':
        iconData = Icons.picture_as_pdf;
        iconColor = Colors.red;
        break;
      case 'txt':
        iconData = Icons.text_fields;
        iconColor = Colors.grey;
        break;
      default:
        iconData = Icons.insert_drive_file;
        iconColor = Colors.grey;
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 64,
            color: iconColor,
          ),
          SizedBox(height: 16),
          Text(
            fileName,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
