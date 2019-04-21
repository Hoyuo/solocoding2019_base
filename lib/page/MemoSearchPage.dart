import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MemoSearchPage extends StatefulWidget {
  @override
  _MemoSearchPageState createState() => _MemoSearchPageState();
}

class _MemoSearchPageState extends State<MemoSearchPage> {
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Memo Search',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(hintText: 'Search Keyword'),
                  controller: textEditingController,
                ),
                FlatButton(onPressed: _memoSearch(), child: null)
              ],
            ),
            ListView(),
          ],
        ));
  }

  _memoSearch() {}
}
