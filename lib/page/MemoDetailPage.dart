import 'package:flutter/material.dart';
import 'package:solocoding2019_base/data/Memo.dart';

class MemoDetailPage extends StatelessWidget {
  final Memo memo;

  MemoDetailPage(this.memo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Memo Detail',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('${memo.title}'),
              Text('${memo.contents}'),
              Text('${memo.dateTime}'),
              memo.image == null ? Text('') : Image.file(memo.image),
            ],
          ),
        ),
      ),
    );
  }
}
