import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:stevo_flutter/data/userInfo.dart';
import 'package:stevo_flutter/widgets/buttons/customButton.dart';

class MaterialTile extends StatefulWidget {
  const MaterialTile(this.backgroundColor,
      {@required this.image,
      @required this.name,
      this.description,
      @required this.id});
  final Color backgroundColor;
  final String? name;
  final String? description;
  final Image? image;
  final String? id;
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.name!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.description!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ],
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
                onPressed: () {
                  //Pop up a dialog box to confirm deletion
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                                'Are you sure you want to delete this material?',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 50),
                            //Actions in a row using Buttons
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      //Delete the material
                                      context.loaderOverlay.show();
                                      Provider.of<UserInfo>(context,
                                              listen: false)
                                          .deleteMaterialFromTopic(widget.id!)
                                          .then((value) {
                                        context.loaderOverlay.hide();
                                        Navigator.pop(context);
                                      });
                                    },
                                    child: Container(
                                      child: Text('Yes'),
                                    )),
                                ElevatedButton(
                                    onPressed: () {
                                      //Don't delete the material
                                      Navigator.pop(context);
                                    },
                                    child: Text('No')),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
              Visibility(
                visible: false,
                child: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {},
                ),
              ),
              Visibility(
                visible: false,
                child: IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
