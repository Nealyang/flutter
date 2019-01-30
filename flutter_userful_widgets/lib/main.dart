import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime _lastTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          children: <Widget>[
            Opacity(
              opacity: .5,
              child: Container(
                height: 30.0,
                color: Colors.blue,
                child: Center(
                  child: Text('透明度为：0.5'),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Opacity(
              opacity: 1.0,
              child: Container(
                height: 30.0,
                color: Colors.red,
                child: Center(
                  child: Text('透明度为：1.0'),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            FadeInImage.assetNetwork(
              placeholder: 'assets/images/tst.jpg',
              image:
                  "https://img.alicdn.com/tfs/TB13Xh3BkvoK1RjSZFNXXcxMVXa-345-717.gif",
              width: 30.0,
              height: 80.0,
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Chip(
                  label: Text('标签1'),
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  deleteIcon: Icon(Icons.clear, color: Colors.black12),
                ),
                Chip(
                  label: Text('标签2'),
                  deleteIcon: Icon(Icons.clear, color: Colors.black12),
                  labelPadding: EdgeInsets.symmetric(horizontal: 10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                  onDeleted: () {
                    print(1122);
                  },
                ),
                Chip(
                  label: Text('标签3', style: new TextStyle(fontSize: 16.0)),
                  avatar: Icon(Icons.search),
                  deleteIcon: Icon(Icons.clear, color: Colors.black12),
                  labelPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  onDeleted: () {},
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text('Begin'),
                Spacer(), // Defaults to a flex of one.
                Text('Middle'),
                // Gives twice the space between Middle and End than Begin and Middle.
                Spacer(flex: 2),
                Text('End'),
              ],
            ),
            DefaultTextStyle(
              style: TextStyle(
                fontSize: 19.0,
                wordSpacing: 10.0,
                color: Colors.blueAccent,
              ),
              child: Column(
                children: <Widget>[
                  Text('先来个默认样式吧'),
                  Text(
                    '这里我们制定下Text的颜色为红色',
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  Text(
                    '这里我们制定下Text的大小',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onWillPop: () async {
        if (_lastTime == null ||
            DateTime.now().difference(_lastTime) >
                Duration(milliseconds: 2000)) {
          _lastTime = DateTime.now();
          return false;
        } else {
          return showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('退出App'),
                  content: Text('别怪我没告诉你哦'),
                  actions: <Widget>[
                    FlatButton(
                      child: Text(
                        'CANCEL',
                      ),
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                    ),
                    FlatButton(
                      child: Text(
                        'SURE',
                      ),
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                    ),
                  ],
                );
              });
        }
      },
    );
  }
}
