import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(top:10.0,bottom:20.0),
      child: new Row(
        children:<Widget>[
          new Expanded(
            child:new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(bottom:8.0),
                  child: Text(
                    'Oeschinen Lake Campground',
                    style:new TextStyle(
                      fontWeight: FontWeight.bold
                    )
                  ),
                  
                ),
                new Text(
                  'Kandersteg,Switzerland',
                  style:new TextStyle(
                    color:Colors.grey
                  )
                )
              ],
            )
          ),
          new Icon(
            Icons.star,
            color:Colors.red
          ),
          new Text('41')
        ]
      ),
    );
  }
}