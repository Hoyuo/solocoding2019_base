import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:solocoding2019_base/data/DatabaseHelper.dart';

class MemoAddPage extends StatefulWidget {
  @override
  _MemoAddPage createState() => _MemoAddPage();
}

class _MemoAddPage extends State<MemoAddPage> {
  final dbHelper = DatabaseHelper.instance;

  final titleTextEditingController = TextEditingController();
  final contentsTextEditingController = TextEditingController();

  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  void dispose() {
    titleTextEditingController.dispose();
    contentsTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Memo Add',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: _memoSave(),
              icon: Icon(Icons.save_alt),
              tooltip: 'save',
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: 'Input Title'),
              controller: titleTextEditingController,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Input Contents'),
              controller: contentsTextEditingController,
            ),
            _image == null ? Text('No Image') : Image.file(_image),
            ButtonBar(
              children: <Widget>[
                RaisedButton(
                  onPressed: _memoSave,
                  child: const Text('save'),
                ),
              ],
            )
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: getImage,
          tooltip: 'Pick Image',
          child: Icon(Icons.add_a_photo),
        ));
  }

  _memoSave() async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnTitle: titleTextEditingController.text,
      DatabaseHelper.columnContents: contentsTextEditingController.text,
      DatabaseHelper.columnTime: DateTime.now().millisecondsSinceEpoch,
      DatabaseHelper.columnImage: _image.path
    };
    final id = await dbHelper.insert(row);
  }
}
