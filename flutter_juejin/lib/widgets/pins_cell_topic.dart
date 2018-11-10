import 'package:flutter/material.dart';
import '../routers/application.dart';
import 'dart:core';

class PinsCellTopic extends StatelessWidget {
  final Map<String, dynamic> topicInfo;
  PinsCellTopic({Key key, this.topicInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _taxtColor = Theme.of(context).primaryColor;
    return InkWell(
      onTap: () {
        String _preUrl=  'https://juejin.im/topic/${topicInfo["objectId"]}';
        // Application.router
        Application.router.navigateTo(context, "/web?url=${Uri.encodeComponent(_preUrl)}&title=${Uri.encodeComponent(topicInfo['title'])}");
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 1.5),
        decoration: BoxDecoration(
          border: Border.all(
            color: _taxtColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.horizontal(
              left: Radius.circular(15.0), right: Radius.circular(15.0)),
        ),
        child: Text(topicInfo['title'], style: TextStyle(color: _taxtColor)),
      ),
    );
  }
}
