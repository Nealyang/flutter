import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget{
  MyAppBar({this.title});//
  final Widget title;

  @override
  Widget build(BuildContext context){
    return new Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal:8.0),
      decoration: new BoxDecoration(
        color:Colors.blue[400]
      ),
      child: Row(
        children: <Widget>[
          new IconButton(
            icon:new Icon(Icons.menu),
            tooltip:'Navigation menu',
            onPressed: (){
              print('点击Menu');
            },
          ),
          new Expanded(
            child:new Center(
              child:title
            )
          ),
          new IconButton(
            icon:Icon(Icons.search),
            tooltip:'Search',
            onPressed: (){
              print('点击搜索按钮');
            },
          )
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Material(
      child: new Column(
        children:<Widget>[
          new MyAppBar(
            title:new Text(
              'Hello World',
              style:Theme.of(context).primaryTextTheme.title
             ),
          ),
          new Expanded(
            child:new Center(
              child:Text('Hello World!!!')
            )
          )
        ]
      ),
    );
  }
}

void main(){
  runApp(
    new MaterialApp(
      title:'My app',
      home:new MyScaffold()
    )
  );
}