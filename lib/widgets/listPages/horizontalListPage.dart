import 'package:flutter/material.dart';
import 'package:stevo_flutter/app_theme.dart';
import 'package:stevo_flutter/functions/subjectToIcon.dart';
import 'package:stevo_flutter/models/test.dart';
import 'package:stevo_flutter/widgets/listCard.dart';
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HorizontalListPageButton(direction: "left", onPressed: _scrollToLeft),
          SizedBox(
            height: 210,
            width: MediaQuery.of(context).size.width * 0.34,
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: widget.listContent.length,
              itemBuilder: (BuildContext context, int index) {
                return ListCard(
                    content: widget.listContent.elementAt(index),
                    child: TestListTile(
                        test: widget.listContent.elementAt(index)));
              },
            ),
          ),
          HorizontalListPageButton(
              direction: "right", onPressed: _scrollToRight),
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
      width: MediaQuery.of(context).size.width * 0.05,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(),
        child: Icon(
          direction == "left" ? Icons.arrow_left : Icons.arrow_right,
        ),
      ),
    );
  }
}
