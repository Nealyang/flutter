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
        appBar:AppBar(
          title:Text('Layout Widget:list、card、stack、listTile'),
        ),
        body:new MyHomePage()
      ),
    );
  }
}



class MyHomePage extends StatelessWidget{



  @override
  Widget build(BuildContext context){

    ListTile listTile = new ListTile(
      title:new Text(
        '这是一个 ListTile widget',
        style:new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0
        )
      ),
      subtitle: Text('这是一个副标题'),
      leading:new Icon(
        Icons.markunread,
        color: Theme.of(context).primaryColor,
      ),
    );

    Stack stack = Stack(
      alignment: const Alignment(0.2, 0.7),
      children: <Widget>[
        new CircleAvatar(
          backgroundImage: new NetworkImage('https://img.alicdn.com/tfs/TB1lIf_f4jaK1RjSZKzXXXVwXXa-1629-1080.jpg'),
          radius: 100.0,
        ),
        new Opacity(
          opacity:0.7,
          child:new Container(
            decoration:new BoxDecoration(
              color:Colors.grey,
            ),
            height: 40.0,
            width: 100.0,
            alignment: Alignment.center,
            child:Text('Nealyang',style:TextStyle(fontSize: 20.0,color: Colors.white)),
          )
        )
      ],
    );

    Card card = new Card(
      child:new Container(
        padding: const EdgeInsets.all(20.0),
        child:new Column(
          children: <Widget>[
            Image.network(
              'https://gw.alicdn.com/tfs/TB1NN.1vQZmBKNjSZPiXXXFNVXa-550-432.png',
              width:600.0,
              height:200.0,
              fit: BoxFit.cover,
            ),
            new Divider(),
            new ListTile(
              title: new Text('(408) 555-1212',
                  style: new TextStyle(fontWeight: FontWeight.w500)),
              leading: new Icon(
                Icons.contact_phone,
                color: Colors.blue[500],
              ),
            ),
            new Divider(),
            new ListTile(
              title: new Text('(408) 555-1212',
                  style: new TextStyle(fontWeight: FontWeight.w500)),
              leading: new Icon(
                Icons.contact_phone,
                color: Colors.blue[500],
              ),
            ),
          ],
        )
      ),
    );


    return new ListView(
      children:<Widget>[
        listTile,
        new Divider(),
        new Center(
          child:stack,
        ),
        new Divider(),
        card,
        listTile,
        listTile,
        card,
        listTile,
      ]
    );
  }
}
