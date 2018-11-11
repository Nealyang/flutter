import 'package:flutter/material.dart';

class IconWidthText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  IconWidthText({Key key, this.color, this.icon, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(icon,color: color,size: 18.0,),
        SizedBox(width: 5.0,),
        Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: 15.0
          ),
        )
      ],
    );
  }
}
