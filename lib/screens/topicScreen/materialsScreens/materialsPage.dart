import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
            subtitle: 'All materials for this topic. Click on a material to view it. Click on the plus button to add a new material.',
            contents: MasonryGridView.count(
            crossAxisCount: 4,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            itemBuilder: (context, index) {
              return MaterialTile(
            Colors.accents[index % Colors.accents.length],
            image: Image.network(
              index%2==0?
              'https://contenthub-static.grammarly.com/blog/wp-content/uploads/2022/02/Effective-Research-Paper.jpg':
              'https://www.wikihow.com/images/thumb/8/8f/Scientific-Research-Paper.png/340px-Scientific-Research-Paper.png',
              fit: BoxFit.cover,
            ),
            description: 'Image $index',
              );
            },
          ),
          ),
        ),
        //Temporary DialogBox
        Column(
          children: [
            //A DialogBox that contains two sections:
            Expanded(child: DialogBox(
              title: "Progress",
              subtitle: "",
              contents: 
              MaterialProgressDialogBox(),
              ),),
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
