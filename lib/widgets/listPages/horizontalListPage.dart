import 'package:flutter/material.dart';
import 'package:stevo_flutter/data/app_theme.dart';
import 'package:stevo_flutter/functions/subjectToIcon.dart';
import 'package:stevo_flutter/models/assessment.dart';
import 'package:stevo_flutter/widgets/tiles/listCard.dart';
import 'package:stevo_flutter/widgets/tiles/testListTile.dart';

class HorizontalListPage extends StatefulWidget {
  HorizontalListPage({super.key, required this.listContent});
  List<dynamic> listContent;

  @override
  _HorizontalListPageState createState() => _HorizontalListPageState();
}

class _HorizontalListPageState extends State<HorizontalListPage> {
  final ScrollController _scrollController = ScrollController();

  void _scrollToLeft() {
    _scrollController.animateTo(
        _scrollController.offset - MediaQuery.of(context).size.width * 0.3,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut);
  }

  void _scrollToRight() {
    _scrollController.animateTo(
        _scrollController.offset + MediaQuery.of(context).size.width * 0.3,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut);
  }

  //scroll to end of list right
  void _scrollToEnd() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  //scroll to start of list left
  void _scrollToStart() {
    _scrollController.animateTo(_scrollController.position.minScrollExtent,
        duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HorizontalListPageButton(
              direction: "left",
              onPressed: _scrollToLeft,
              onHold: _scrollToStart),
          SizedBox(
            height: 210,
            width: MediaQuery.of(context).size.width * 0.34,
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: widget.listContent.length,
              itemBuilder: (BuildContext context, int index) {
                //print listcontent details before returning
                print("Test name is:" + widget.listContent.elementAt(index).id);
                return ListCard(
                    content: widget.listContent.elementAt(index),
                    child: TestListTile(
                        test: widget.listContent.elementAt(index)));
              },
            ),
          ),
          HorizontalListPageButton(
              direction: "right",
              onPressed: _scrollToRight,
              onHold: _scrollToEnd),
        ],
      ),
    );
  }
}

class HorizontalListPageButton extends StatelessWidget {
  HorizontalListPageButton({
    this.key,
    required this.direction,
    required this.onPressed,
    this.onHold,
  });

  final Key? key;
  final String direction;
  final VoidCallback onPressed;
  final VoidCallback? onHold;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.04,
      child: GestureDetector(
        onLongPress: onHold,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(),
          child: Icon(
            direction == "left" ? Icons.arrow_left : Icons.arrow_right,
          ),
        ),
      ),
    );
  }
}
