import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        appBar:AppBar(title:Text('Layout Widget之GridView')),
        body:new MyHomePage()
      )
    );
  }
}

List<Container> _buildGridTileList(int count) {

  return new List<Container>.generate(
      count,
      (int index) =>
          new Container(child: new Image.asset('images/${index+1}.jpg')));
}

Widget buildGrid() {
  return new GridView.extent(
      maxCrossAxisExtent: 150.0,
      padding: const EdgeInsets.all(4.0),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      children: _buildGridTileList(10));
}

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return  new Center(
        child: buildGrid(),
      );
  }
}
