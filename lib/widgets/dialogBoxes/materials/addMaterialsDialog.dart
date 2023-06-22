import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:stevo_flutter/data/userInfo.dart';
import 'package:stevo_flutter/services/material.dart';
import 'package:stevo_flutter/widgets/dialogBoxes/materials/horizontalImageList.dart';

class AddMaterialsDialog extends StatefulWidget {
  AddMaterialsDialog({key}) : super(key: key);

  @override
  State<AddMaterialsDialog> createState() => _AddMaterialsDialogState();
}

class _AddMaterialsDialogState extends State<AddMaterialsDialog> {
  bool uploadingText = false;
  List<File> files = [];
  String materialText = "";
  String materialName = "";
  String materialDescription = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Materials'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          //Error text:
          if (error != "")
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            ),
          //Add a text field for the name of the material
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  materialName = value;
                  print("Name changed to " + materialName);
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Material Name',
              ),
            ),
          ),
          SizedBox(height: 16),
          //Add a text field for the description of the material
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  materialDescription = value;
                  print("Description changed to " + materialDescription);
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Material Description',
              ),
            ),
          ),
          SizedBox(height: 16),
          //Add a toggle button to switch between uploading a file and uploading text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text("Upload File"),
                Spacer(),
                Transform.scale(
                  scale: 0.7,
                  child: Switch(
                    value: uploadingText,
                    onChanged: (value) {
                      setState(() {
                        uploadingText = value;
                      });
                    },
                  ),
                ),
                Spacer(),
                Text("Upload Text"),
              ],
            ),
          ),
          SizedBox(height: 16),
          //Add a button to upload a file if the user is uploading a file
          if (!uploadingText)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(allowMultiple: true);
                  if (result != null) {
                    setState(() {
                      files = result.paths.map((path) => File(path!)).toList();
                    });
                  } else {
                    // User canceled the picker
                  }
                },
                child: Text('Upload File'),
              ),
            ),
          //Add a text field to upload text if the user is uploading text
          if (uploadingText)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    materialText = value;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Material Text',
                ),
              ),
            ),
          // Add a preview of the material if the user is uploading a file
          if (!uploadingText)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 200,
                width: double.infinity,
                color: files.isEmpty ? Colors.grey : Colors.transparent,
                child: files.isEmpty
                    ? Center(child: Text('No File Uploaded'))
                    : //ListView of images in files and a delete button to remove each image:
                    HorizontalImageList(
                        listContent: files,
                        callback: (index) {
                          setState(() {
                            files.removeAt(index);
                          });
                        },
                      ),
              ),
            ),
          SizedBox(height: 16),
          //Add a button to add the material to the topic
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () async {
                  context.loaderOverlay.show();
                  print('Uploading Text:' + uploadingText.toString());
                  //if the user is not uploading files, upload the text
                  if (uploadingText) {
                    if (await uploadMaterialText(
                        Provider.of<UserInfo>(context, listen: false)
                            .currentTopic
                            .id!,
                        materialName,
                        materialDescription,
                        materialText)) {
                      context.loaderOverlay.hide();
                      Provider.of<UserInfo>(context, listen: false)
                          .loadMaterials();
                      Navigator.pop(context);
                    } else {
                      context.loaderOverlay.hide();
                      setState(() {
                        error = "Error uploading material, please try again";
                      });
                    }
                  }
                },
                child: Text('Add Material'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
