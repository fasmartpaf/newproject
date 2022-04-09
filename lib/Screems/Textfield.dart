import 'dart:io';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TextF extends StatefulWidget {
  @override
  State<TextF> createState() => _TextState();
}

class _TextState extends State<TextF> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String seeingimages = '';
  TextEditingController title = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  final FirebaseStorage firestore = FirebaseStorage.instance;
  File? imagefiles;

  ///Getting imags from camera
  Future Imgafromcamera() async {
    final ImagePicker picker = ImagePicker();
    await picker.pickImage(source: ImageSource.camera).then((value) {
      if (value != null) {}
    });
  }

  uploadimagge(XFile file) async {
    var ref = FirebaseStorage.instance.ref('files');
    await ref.putFile(File(file.path));
    seeingimages = File((file.path)).readAsBytes() as String;

    String imageUrl = await ref.getDownloadURL();
    setState(() async {
      print(imageUrl);
    });
  }

  /// Getting images  from Galley
  Future ImagesinGallery() async {
    var files = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      seeingimages = files!.path;
      // print(files.path);
    });
  }

  ///  Future uploadimages()async {
  ///    String FilesName= Uuid().v1();
  /// var ref=FirebaseStorage.instance.ref().child('NotesBook').child('NotesBook');
  /// var imagefiles;
  /// var uploadtask=  await ref.putFile(imagefiles.typ);
  /// var Imagetask = await uploadtask.ref.getDownloadURL();
  ///
  /// print(Imagetask);
  ///
  ///  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Notes Screen',
            style: TextStyle(
                fontSize: 30,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView(
          children: [
            Container(
              height: 70,
              width: 50,
              child: Center(
                child: seeingimages.isEmpty
                    ? CircularProgressIndicator(
                        value: 20,
                        color: Colors.red,
                        backgroundColor: Colors.lightBlueAccent,
                      )
                    : Image.file(File(seeingimages)),
              ),
            ),
            Center(
              child: Text(
                'KEEP NOTES HERE',
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                controller: title,
                onChanged: (value) {
                  value = title.text;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    fillColor: Colors.grey,
                    focusColor: Colors.grey,
                    labelText: 'Title',
                    hintText: 'ENTER TITLE',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 20,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                controller: email,
                textDirection: TextDirection.ltr,
                onChanged: (value) {
                  value = email.text;
                },
                autofocus: true,
                maxLines: 100,
                minLines: 10,
                maxLength: 100,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    fillColor: Colors.grey,
                    focusColor: Colors.grey,
                    labelText: 'DATA',
                    alignLabelWithHint: true,
                    hintText: 'ENTER HERE DATA',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 20,
                    )),
              ),
            ),
            Text(
              'upload images',
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      uploadimagge;
                      ImagesinGallery();
                    },
                    icon: Icon(Icons.browse_gallery)),
                IconButton(
                    onPressed: () {
                      Imgafromcamera();
                      uploadimagge(XFile(seeingimages.padLeft(2)));
                    },
                    icon: Icon(Icons.camera)),
                IconButton(
                    onPressed: () {
                      uploadimagge;
                      uploadimagge(XFile(seeingimages.padLeft(2)));
                    },
                    icon: Icon(Icons.send))
              ],
            ),
            Container(
                decoration: BoxDecoration(),
                height: 50,
                padding: const EdgeInsets.fromLTRB(
                  40,
                  0,
                  40,
                  0,
                ),
                child: ElevatedButton(
                  child: const Text('SAVE DATA'),
                  onPressed: () {
                    _firestore.collection("NotesBook").add({
                      "title": title.text,
                      "Text": email.text,
                    }).then((value) {
                      // print(value.id);
                    });
                  },
                )),
          ],
        ));
  }
}
