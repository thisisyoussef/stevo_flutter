import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class AddMaterialsDialog extends StatefulWidget {
  AddMaterialsDialog({
    key
  }) : super(key: key);

  @override
  State<AddMaterialsDialog> createState() => _AddMaterialsDialogState();
}

class _AddMaterialsDialogState extends State<AddMaterialsDialog> {
  bool uploadingText = false;
  List<File> files = [];
  

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Materials'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          //Add a text field for the name of the material
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
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
                onPressed: () async{
                  FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);
                  if(result != null) {
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
                color: files.isEmpty? Colors.grey:Colors.transparent,
                child: files.isEmpty? Center(child: Text('No File Uploaded')):ListView.builder(
                  itemCount: files.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(files[index].path.split('/').last),
                    );
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
                onPressed: () {},
                child: Text('Add Material'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
