import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stevo_flutter/app_theme.dart';

import '../../data/userInfo.dart';
import '../../models/topic.dart';
import '../tiles/topicBlockTile.dart';

class PathDialog extends StatefulWidget {
  PathDialog({
    super.key,
  });

  @override
  State<PathDialog> createState() => _PathDialogState();
}

class _PathDialogState extends State<PathDialog> {
  //listview controller:
  ScrollController _scrollController = ScrollController();

  //show buttons:
  bool _showLeftButton = false;

  bool _showRightButton = true;

  //scrollRight function:
  void _scrollRight() {
    _scrollController.animateTo(_scrollController.offset + 200,
        curve: Curves.linear, duration: Duration(milliseconds: 500));
    _setVisibility();
  }

  //setVisibility function:
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

  //scrollLeft function:
  void _scrollLeft() {
    _scrollController.animateTo(_scrollController.offset - 200,
        curve: Curves.linear, duration: Duration(milliseconds: 500));
    _setVisibility();
  }

  //scrollToEnd function:
  void _scrollToEnd() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        curve: Curves.linear, duration: Duration(milliseconds: 1000));
    _setVisibility();
  }

  //scrollToStart function:
  void _scrollToStart() {
    _scrollController.animateTo(_scrollController.position.minScrollExtent,
        curve: Curves.linear, duration: Duration(milliseconds: 1000));
    _setVisibility();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          itemCount: Provider.of<UserInfo>(context, listen: true).topics.length,
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return TopicBlock(
              topic:
                  Provider.of<UserInfo>(context, listen: true).topics[index]!,
            );
          },
        ),
        Visibility(
          visible: _showRightButton,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: LongPressButton(
                onPressed: _scrollRight,
                onLongPress: _scrollToEnd,
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(30.0),
                  child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: _scrollRight,
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: appTheme.primaryColor,
                    ),
                  ),
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
              padding: const EdgeInsets.only(left: 0.0),
              child: LongPressButton(
                onPressed: _scrollLeft,
                onLongPress: _scrollToStart,
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(30.0),
                  child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: _scrollLeft,
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: appTheme.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class LongPressButton extends StatefulWidget {
  final VoidCallback onPressed;
  final VoidCallback onLongPress;
  final Widget child;

  const LongPressButton({
    Key? key,
    required this.onPressed,
    required this.onLongPress,
    required this.child,
  }) : super(key: key);

  @override
  _LongPressButtonState createState() => _LongPressButtonState();
}

class _LongPressButtonState extends State<LongPressButton> {
  bool _isLongPressing = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      onLongPress: () {
        setState(() {
          _isLongPressing = true;
        });
        widget.onLongPress();
      },
      onLongPressEnd: (_) {
        setState(() {
          _isLongPressing = false;
        });
      },
      child: AnimatedOpacity(
        opacity: _isLongPressing ? 0.5 : 1.0,
        duration: Duration(milliseconds: 200),
        child: widget.child,
      ),
    );
  }
}
