import 'package:flutter/material.dart';

import '../modules/title_section.dart';
import '../modules/icons_section.dart';
import '../modules/text_section.dart';
class DetailPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar:new AppBar(
        title:Text('注意布局代码')
      ),
      body:new Column(
        children:<Widget>[
          new Image.asset(
            'images/test.jpg',
            width: 600.0,
            height:240.0,
            fit:BoxFit.cover
          ),
          new TitleSection(),
          new IconsSection(),
          new TextSection()
        ]
      )
    );
  }
}