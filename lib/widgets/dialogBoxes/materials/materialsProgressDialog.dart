import 'package:flutter/material.dart';
import 'package:stevo_flutter/app_theme.dart';

class MaterialProgressDialogBox extends StatelessWidget {
  const MaterialProgressDialogBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //A circular progress bar that shows the progress of the topic
          //Use the CircularProgressIndicator widget
          Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    backgroundColor: appTheme.accentColor,
                    value: 0.5,
                  ),
                  SizedBox(height: 10,),
                  Text("50% Complete", style: TextStyle(fontSize: 15),),
                  SizedBox(height: 10,),
                  //Horizontal divider:
                  Divider(
                    color: Colors.black,
                    thickness: 2,
                    height: 20,
                  ),
                  SizedBox(height: 10,),
                  //A big number that shows the number of tests completed
                  //Underneath it, a text that says "Tests Completed" in small font

                  Text("2", style: TextStyle(fontSize: 30),),
                  Text("Tests Taken", style: TextStyle(fontSize: 15),),

                ],
              ),
             
            ],
          ),
          SizedBox(height: 0,width: 20,),
          //Line divider:
          VerticalDivider(
            thickness: 1,
            width: 5,
          ),
          SizedBox(height: 0,width: 10,),

           //A list of materials that have been completed
              //Use the ListTile widget
              Column(
                children: [
                  //Title:
                  Text("Completed Materials", style: TextStyle(fontSize: 15),),
                  SizedBox(height: 10,),
                  Container(
                    width: 200,
                    child: ListTile(
                      leading: Icon(Icons.check),
                      title: Text("Material 1", style: TextStyle(fontSize: 13),
                    ),
                  ),
                  ),
                  Container(
                    width: 200,
                    child: ListTile(
                      leading: Icon(Icons.check),
                      title: Text("Material 2", style: TextStyle(fontSize: 13),
                    ),
                  ),
                  ),
                  Container(
                    width: 200,
                    child: ListTile(
                      leading: Icon(Icons.check),
                      title: Text("Material 3", style: TextStyle(fontSize: 13),
                    ),
                  ),
                  ),
                ],
              ),
        ],
      ),
    );
  }
}
