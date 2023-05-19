
import 'package:flutter/material.dart';

class MaterialTile extends StatefulWidget {
  const MaterialTile(this.backgroundColor, {@required this.image, @required this.description});
  final Color backgroundColor;
  final String? description;
  final Image? image;
  @override
  _MaterialTileState createState() => _MaterialTileState();
}


class _MaterialTileState extends State<MaterialTile> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Card(
          color: widget.backgroundColor,
          child: InkWell(
            onHover: (value) {
              print("hovered");
              setState(() {
                _isHovered = value;
              });
            },
            onTap: () => print('tapped'),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: widget.image,
              ),
            ),
          ),
        ),
          Positioned.fill(
            child: Container(
              color: Colors.black38,
              child: Center(
                child: Text(
                  widget.description!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          ],
    );
  }
}

