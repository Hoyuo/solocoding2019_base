import 'package:flutter/material.dart';

import 'package:solocoding2019_base/page/MemoMainPage.dart';

void main() => runApp(MyApp());

// This widget is the root of your application.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memo App',
      theme: ThemeData(primaryColor: Colors.white, primarySwatch: Colors.blue),
      home: MemoMainPage(),
    );
  }
}
