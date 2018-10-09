import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget{

  final String title;

  SecondPage({this.title}):super();

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: AppBar(
        title:Text(title)
      ),
      body:Center(
        child:Text('other Page body')
      )
    );
  }
}

