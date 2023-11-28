import 'package:flutter/material.dart';

class ScrollablePath extends StatefulWidget {
  final List<Widget> children;
  final int scrollTo;

  ScrollablePath({Key? key, required this.children, required this.scrollTo})
      : super(key: key);

  @override
  _ScrollablePathState createState() => _ScrollablePathState();
}

class _ScrollablePathState extends State<ScrollablePath> {
  ScrollController _scrollController = ScrollController();
  bool _showLeftButton = false;
  bool _showRightButton = true;

  void _scrollRight() {
    _scrollController.animateTo(_scrollController.offset + 200,
        curve: Curves.linear, duration: Duration(milliseconds: 500));
    _setVisibility();
  }

  void _setVisibility() {
    if (_scrollController.offset >=
        _scrollController.position.maxScrollExtent - 50) {
      setState(() {
        _showRightButton = false;
      });
    }
    if (_scrollController.offset <=
        _scrollController.position.minScrollExtent + 50) {
      setState(() {
        _showLeftButton = false;
      });
    }
    if (_scrollController.offset >
        _scrollController.position.minScrollExtent + 50) {
      setState(() {
        _showLeftButton = true;
      });
    }
    if (_scrollController.offset <
        _scrollController.position.maxScrollExtent - 50) {
      setState(() {
        _showRightButton = true;
      });
    }
  }

  void _scrollLeft() {
    _scrollController.animateTo(_scrollController.offset - 200,
        curve: Curves.linear, duration: Duration(milliseconds: 500));
    _setVisibility();
  }

  void _scrollTo(int index) {
    _scrollController.animateTo(index * 200.0,
        curve: Curves.linear, duration: Duration(milliseconds: 100));
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        _scrollTo(widget.scrollTo);
        _setVisibility();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          itemCount: widget.children.length,
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: [
                widget.children[index],
                if (index < widget.children.length - 1)
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.grey,
                  ),
              ],
            );
          },
        ),
        Visibility(
          visible: _showRightButton,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: FloatingActionButton(
                onPressed: _scrollRight,
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: _showLeftButton,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: FloatingActionButton(
                onPressed: _scrollLeft,
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
