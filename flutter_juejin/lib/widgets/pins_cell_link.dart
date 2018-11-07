import 'package:flutter/material.dart';
import 'dart:core';
import '../routers/application.dart';

class PinsCellLink extends StatelessWidget {
  final String linkUrl;

  PinsCellLink({Key key, this.linkUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color textColor = Theme.of(context).primaryColor;
    return Container(
      width: 100.0,
      child: InkWell(
        onTap: () {
          print(linkUrl);
           Application.router.navigateTo(context, "/web?url=${Uri.encodeComponent(linkUrl)}&title=${Uri.encodeComponent('掘金沸点')}");
        },
        child: Row(
          children: <Widget>[
            Icon(
              Icons.link,
              color: textColor,
            ),
            Text(
              '网页链接',
              style: TextStyle(color: textColor),
            )
          ],
        ),
      ),
    );
  }
}
