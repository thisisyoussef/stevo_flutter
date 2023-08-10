import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:stevo_flutter/data/userInfo.dart';
import 'package:stevo_flutter/services/material.dart';
import 'package:stevo_flutter/widgets/buttons/customButton.dart';
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
      title: Text(
        'Add Materials',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      content: SizedBox(
        height: 700, // set a fixed height for the dialog
        width: 600,
        child: SingleChildScrollView(
          child: Column(
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
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              SizedBox(height: 16),
              //Add a text field for the name of the material
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Material Name',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          materialName = value;
                          print("Name changed to " + materialName);
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter the name of the material',
                        hintStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              //Add a text field for the description of the material
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Material Description',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          materialDescription = value;
                          print(
                              "Description changed to " + materialDescription);
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter a description of the material',
                        hintStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              //Add a toggle button to switch between uploading a file and uploading text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Upload Material',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                uploadingText = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: uploadingText
                                    ? Colors.transparent
                                    : Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: Column(
                                children: [
                                  Icon(Icons.file_upload, size: 32),
                                  SizedBox(height: 8),
                                  Text(
                                    'Upload File',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                uploadingText = true;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: uploadingText
                                    ? Colors.grey[200]
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: Column(
                                children: [
                                  Icon(Icons.text_fields, size: 32),
                                  SizedBox(height: 8),
                                  Text(
                                    'Upload Text',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              //Add a button to upload a file if the user is uploading a file
              if (!uploadingText)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
                      width: 200,
                      child: CustomButton(
                        icon: Icons.file_upload,
                        text: 'Upload File',
                        onPressed: () async {
                          FilePickerResult? result = await FilePicker.platform
                              .pickFiles(allowMultiple: true);
                          if (result != null) {
                            setState(() {
                              //if files is empty:
                              if (files.isEmpty) {
                                //add the first file
                                files = result.paths
                                    .map((path) => File(path!))
                                    .toList();
                              } else {
                                //if files is not empty, add the new files to the list
                                files.addAll(
                                    result.paths.map((path) => File(path!)));
                              }
                            });
                          } else {
                            // User canceled the picker
                          }
                        },
                      ),
                    ),
                  ),
                ),
              //Add a text field to upload text if the user is uploading text
              if (uploadingText)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Material Text',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: double.infinity,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                materialText = value;
                              });
                            },
                            maxLines: null,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter the text of the material',
                              hintStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                              contentPadding: const EdgeInsets.all(10),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              // Add a preview of the material if the user is uploading a file
              if (!uploadingText)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color:
                          files.isEmpty ? Colors.grey[200] : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: files.isEmpty
                        ? Center(
                            child: Text(
                              'No File Uploaded',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 16,
                              ),
                            ),
                          )
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: SizedBox(
                    width: 200,
                    child: CustomButton(
                      disabled:
                          uploadingText ? materialText.isEmpty : files.isEmpty,
                      //Done check mark icon
                      icon: Icons.done,
                      text: 'Publish to Library',
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
                              error =
                                  "Error uploading material, please try again";
                            });
                          }
                        }
                        //if the user is uploading files, upload the files
                        else {
                          if (await uploadMaterialFiles(
                              Provider.of<UserInfo>(context, listen: false)
                                  .currentTopic
                                  .id!,
                              materialName,
                              materialDescription,
                              files)) {
                            context.loaderOverlay.hide();
                            Provider.of<UserInfo>(context, listen: false)
                                .loadMaterials();
                            Navigator.pop(context);
                          } else {
                            context.loaderOverlay.hide();
                            setState(() {
                              error =
                                  "Error uploading material, please try again";
                            });
                          }
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
