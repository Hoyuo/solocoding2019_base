import 'dart:io';

class Memo {
  String title;
  String contents;
  DateTime dateTime;
  File image;

  Memo(this.title, this.contents, this.dateTime, this.image);

  Memo.fromMap(dynamic obj) {
    this.title = obj["name"];
    this.contents = obj["contents"];
    this.dateTime = DateTime.fromMicrosecondsSinceEpoch(obj["dateTime"]);
    this.image = File(obj["image"]);
  }
}
