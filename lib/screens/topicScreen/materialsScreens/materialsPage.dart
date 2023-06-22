import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:stevo_flutter/data/userInfo.dart';
import 'package:stevo_flutter/widgets/dialogBoxes/dialogBox.dart';
import 'package:stevo_flutter/widgets/dialogBoxes/materials/materialsActionsDialog.dart';
import 'package:stevo_flutter/widgets/dialogBoxes/materials/materialsProgressDialog.dart';
import 'package:stevo_flutter/widgets/tiles/materialTile.dart';

class MaterialsPage extends StatelessWidget {
  const MaterialsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: DialogBox(
              title: 'Materials',
              subtitle:
                  'All materials for this topic. Click on a material to view it. Click on the plus button to add a new material.',
              contents: Provider.of<UserInfo>(context, listen: true)
                          .materials
                          .length !=
                      0
                  ? MasonryGridView.count(
                      itemCount: Provider.of<UserInfo>(context, listen: true)
                          .materials
                          .length
                      //set the count to be based on the number of materials from provider
                      ,
                      crossAxisCount: Provider.of<UserInfo>(context,
                                          listen: true)
                                      .materials
                                      .length %
                                  2 ==
                              0 //if the number of materials is even, set the crossAxisCount to 2, else set it to 3
                          ? 2
                          : 3,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      itemBuilder: (context, index) {
                        return MaterialTile(
                          Colors.accents[index % Colors.accents.length],
                          image: Image.network(
                            index % 2 == 0
                                ? 'https://contenthub-static.grammarly.com/blog/wp-content/uploads/2022/02/Effective-Research-Paper.jpg'
                                : 'https://www.wikihow.com/images/thumb/8/8f/Scientific-Research-Paper.png/340px-Scientific-Research-Paper.png',
                            fit: BoxFit.cover,
                          ),
                          name:
                              '${Provider.of<UserInfo>(context, listen: true).materials[index].name}',
                          description:
                              '${Provider.of<UserInfo>(context, listen: true).materials[index].description}',
                          id: Provider.of<UserInfo>(context, listen: true)
                              .materials[index]
                              .id,
                        );
                      },
                    )
                  : Center(
                      child: Text(
                          "No materials yet. Click on the plus button to add a new material."),
                    )),
        ),
        //Temporary DialogBox
        Column(
          children: [
            //A DialogBox that contains two sections:
            Expanded(
              child: DialogBox(
                title: "Progress",
                subtitle: "",
                contents: MaterialProgressDialogBox(),
              ),
            ),
            Expanded(
              child: DialogBox(
                title: '',
                subtitle: '',
                contents: //Column of Custom Buttons to conduct different actions on the topic
                    //Add Material, Delete Material, Edit Material,
                    //Use the Custom Button widget
                    MaterialActionsDialogBox(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
