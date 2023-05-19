import 'package:flutter/material.dart';
import 'package:stevo_flutter/app_theme.dart';
import 'package:stevo_flutter/functions/subjectToIcon.dart';
import 'package:stevo_flutter/models/test.dart';
import 'package:stevo_flutter/widgets/listCard.dart';
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
    return Container(
      child: Row(
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
            width: MediaQuery.of(context).size.width * 0.1,
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
                          child: Image.file(
                            widget.listContent[index],
                            fit: BoxFit.fitWidth,
                          ),
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
          //If there are more than 1 images, show the buttons:
          widget.listContent.length > 1
              ? HorizontalListPageButton(
                  direction: "right", onPressed: _scrollToRight)
              : Container(),
        ],
      ),
    );
  }
}

class HorizontalListPageButton extends StatelessWidget {
  HorizontalListPageButton(
      {super.key, required this.direction, required this.onPressed});
  String direction;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.04,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: appTheme.primaryColor,
          shape: CircleBorder(),
          padding: EdgeInsets.all(0),
        ),
        child: Icon(
          direction == "left" ? Icons.arrow_left : Icons.arrow_right,
          size: 40,
        ),
      ),
    );
  }
}
