import 'package:flutter/material.dart';
import 'package:solocoding2019_base/data/DatabaseHelper.dart';
import 'package:solocoding2019_base/data/Memo.dart';
import 'package:solocoding2019_base/page/MemoAddPage.dart';
import 'package:solocoding2019_base/page/MemoDetailPage.dart';
import 'package:solocoding2019_base/page/MemoSearchPage.dart';

class MemoMainPage extends StatefulWidget {
  @override
  _MemoMainPageState createState() => _MemoMainPageState();
}

class _MemoMainPageState extends State<MemoMainPage> {
  final dbHelper = DatabaseHelper.instance;

  List<Memo> data = [];


  @override
  void initState() {
    super.initState();
    _query();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Memo App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            tooltip: 'search',
            onPressed: _memoSearch,
          ),
          IconButton(
            icon: Icon(
              Icons.sort,
            ),
            tooltip: 'sort',
            onPressed: _memoSort,
          ),
          IconButton(
            icon: Icon(
              Icons.share,
            ),
            tooltip: 'share',
            onPressed: _memoShare,
          ),
        ],
      ),
      body: _memoListBuilder(),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigationMemoAddPage,
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }


  void _navigationMemoAddPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MemoAddPage()));
  }

  void _memoSearch() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MemoSearchPage()));
  }

  void _memoSort() {
    _query();
  }

  void _memoShare() {}

  Widget _memoListBuilder() {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Row(children: <Widget>[
              Text('순번',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
              Padding(padding: EdgeInsets.only(right: 10.0)),
              Text('내용',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
              Padding(padding: EdgeInsets.only(right: 200.0)),
              Text('날짜',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0))
            ]),

            ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return _memoTile(data[index]);
              },
            )
          ]),
        ));
  }

  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('query all rows:');
    setState(() {
      data = [];
      allRows.forEach((row) {
        data.add(Memo.fromMap(row));
      });
    });
    allRows.forEach((row) => print(row));
  }

  _memoTile(Memo memo) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MemoDetailPage(memo);
        }));
      },
      child: Card(
          elevation: 4.0,
          child: SizedBox(
              height: 40.0,
              child: Row(children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    right: 10.0,
                  ),
                ),
                Text('${memo.title}'),
                Padding(
                  padding: EdgeInsets.only(
                    right: 10.0,
                  ),
                ),
                Text('${memo.contents}'),
                Padding(
                  padding: EdgeInsets.only(
                    right: 200.0,
                  ),
                ),
                Text('${memo.dateTime}')
              ]))),
    );
  }
}
