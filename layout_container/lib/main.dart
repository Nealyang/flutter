import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        appBar:AppBar(title:Text('Layout布局Widget之Container')),
        body:new MyHomePage()
      ),
    );
  }
}

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){

    Container cell (String imgSrc){
      return new Container(
        decoration: new BoxDecoration(
          border:Border.all(width:6.0,color:Colors.black38),
          borderRadius: BorderRadius.all(const Radius.circular(8.0))
        ),
        child: Image.asset(
          'images/$imgSrc',
          width: 180.0,
          height: 180.0,
          fit: BoxFit.cover,
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(10.0),
      color: Colors.grey,
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children:<Widget>[
          new Container(
            margin: const EdgeInsets.only(bottom:10.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:<Widget>[
                cell('1.jpg'),
                cell('2.jpg')
              ]
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(bottom:10.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:<Widget>[
                cell('3.jpg'),
                cell('4.jpg')
              ]
            ),
          ),
        ]
      ),
    );
  }
}
