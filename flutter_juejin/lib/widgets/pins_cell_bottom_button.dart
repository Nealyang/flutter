import 'package:flutter/material.dart';

class PinsCellBottomButton extends StatelessWidget {
  
  final int likedCount;
  final int commentCount;

   Color defaultColor =  Colors.black26;

  PinsCellBottomButton({Key key, this.commentCount, this.likedCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
        height: 40.0,
        decoration: BoxDecoration(
            border: Border(
          top: BorderSide(
            color: defaultColor,
            width: 1.0,
          ),
        )),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconWithText(
              icon: Icon(
                Icons.comment,
                color: defaultColor,
                size: 18.0,
              ),
              text: commentCount.toString(),
            ),
            Container(height: 30.0,width: 1,color: defaultColor,),
            IconWithText(
              icon: Icon(
                Icons.favorite,
                color: defaultColor,
                size: 18.0,
              ),
              text: likedCount.toString(),
            )
          ],
        ));
  }
}

class IconWithText extends StatelessWidget {
  final Icon icon;
  final String text;
  Color defaultColor =  Colors.black26;
  IconWithText({Key key, this.icon, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          icon,
          SizedBox(
            width: 5.0,
          ),
          Text(text, style: TextStyle(color: defaultColor)),
        ],
      ),
    );
  }
}
