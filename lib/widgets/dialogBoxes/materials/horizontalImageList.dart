import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stevo_flutter/data/app_theme.dart';
import 'package:stevo_flutter/functions/subjectToIcon.dart';
import 'package:stevo_flutter/models/assessment.dart';
import 'package:stevo_flutter/widgets/dialogBoxes/materials/materialsContentBox.dart';
import 'package:stevo_flutter/widgets/tiles/listCard.dart';
import 'package:stevo_flutter/widgets/tiles/testListTile.dart';

class HorizontalImageList extends StatefulWidget {
  HorizontalImageList(
      {super.key, required this.listContent, required this.callback});
  List<dynamic> listContent;
  Function callback;

  @override
  _HorizontalImageListState createState() => _HorizontalImageListState();
}

class _HorizontalImageListState extends State<HorizontalImageList> {
  final ScrollController _scrollController = ScrollController();

  double imageWidthMultiplier = 0.1;

  void _scrollToNewFile(int newFileIndex) {
    _scrollController.animateTo(
      MediaQuery.of(context).size.width * imageWidthMultiplier * newFileIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToLeft() {
    _scrollController.animateTo(
        _scrollController.offset -
            MediaQuery.of(context).size.width * imageWidthMultiplier,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut);
  }

  void _scrollToRight() {
    _scrollController.animateTo(
        _scrollController.offset +
            MediaQuery.of(context).size.width * imageWidthMultiplier,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        //If there are more than 1 images, show the buttons:
        widget.listContent.length > 1
            ? HorizontalListPageButton(
                direction: "left", onPressed: _scrollToLeft)
            : Container(),
        SizedBox(
          height: 210,
          width: MediaQuery.of(context).size.width * 0.2,
          child: ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: widget.listContent.length,
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: [
                  Center(
                    child: SizedBox(
                      height: 210,
                      width: MediaQuery.of(context).size.width *
                          imageWidthMultiplier,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: materialContentBox(widget.listContent[index]),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          widget.listContent.removeAt(index);
                          widget.callback(index);
                        });
                      },
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),
                  ),
                  //Buttons to scroll through the images:
                ],
              );
            },
          ),
        ),
        //If there is more than 1 file, show the buttons:
        widget.listContent.length > 1
            ? HorizontalListPageButton(
                direction: "right", onPressed: _scrollToRight)
            : Container(),
      ],
    );
  }
}

class HorizontalListPageButton extends StatelessWidget {
  const HorizontalListPageButton({
    Key? key,
    required this.direction,
    required this.onPressed,
  }) : super(key: key);

  final String direction;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape: CircleBorder(),
          elevation: 2,
        ),
        child: Icon(
          direction == "left" ? Icons.arrow_back_ios : Icons.arrow_forward_ios,
          color: Colors.black,
          size: 24,
        ),
      ),
    );
  }
}
