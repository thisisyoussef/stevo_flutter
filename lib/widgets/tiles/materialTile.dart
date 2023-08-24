import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:stevo_flutter/data/userInfo.dart';
import 'package:stevo_flutter/models/material.dart';
import 'package:stevo_flutter/widgets/buttons/customButton.dart';
import 'package:stevo_flutter/widgets/dialogBoxes/materials/materialGridTileBackground.dart';

class MaterialTile extends StatefulWidget {
  const MaterialTile(this.backgroundColor,
      {@required this.image,
      @required this.name,
      this.description,
      @required this.id,
      required this.material});
  final Color backgroundColor;
  final String? name;
  final String? description;
  final Image? image;
  final String? id;
  final MaterialModel material;
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
        InkWell(
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
              //materialGridTileBackground(widget.material),
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
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.red),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: IconButton(
                  icon: Icon(Icons.delete),
                  splashRadius: 24,
                  splashColor: Colors.green.withOpacity(0.5),
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  iconSize: 32,
                  padding: EdgeInsets.all(12),
                  color: Colors.white,
                  tooltip: 'Preview',
                  disabledColor: Colors.grey,
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
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(height: 50),
                              //Actions in a row using Buttons
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 16),
                                      child: Text(
                                        'Yes',
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      //Don't delete the material
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(color: Colors.grey),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 16),
                                        child: Text(
                                          'No',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {},
                    splashRadius: 24,
                    splashColor: Colors.blue.withOpacity(0.5),
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    iconSize: 32,
                    padding: EdgeInsets.all(12),
                    color: Colors.white,
                    tooltip: 'Edit',
                    disabledColor: Colors.grey,
                    //Add a border and shadow to the icon button
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.green),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: IconButton(
                  icon: Icon(Icons.remove_red_eye),
                  onPressed: () {},
                  splashRadius: 24,
                  splashColor: Colors.green.withOpacity(0.5),
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  iconSize: 32,
                  padding: EdgeInsets.all(12),
                  color: Colors.white,
                  tooltip: 'Preview',

                  disabledColor: Colors.grey,
                  //Add a border and shadow to the icon button
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
