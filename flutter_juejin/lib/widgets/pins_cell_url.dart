import 'package:flutter/material.dart';
import '../routers/application.dart';
import 'dart:core';

class PinsCellUrl extends StatelessWidget {
  final String url;
  final String urlPic;
  final String urlTitle;

  PinsCellUrl({Key key, this.url, this.urlPic, this.urlTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Application.router.navigateTo(context,"/web?url=${Uri.encodeComponent(url)}&title=${Uri.encodeComponent(urlTitle)}");
      },
          child: Container(
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.symmetric(horizontal: 14.0,vertical: 10.0),
          height: 100,
          decoration: BoxDecoration(
              border:
                  Border.all(color: Theme.of(context).accentColor, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(4.0))),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                    Text(
                      urlTitle,
                      style:
                          TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      url,
                      style: TextStyle(
                          fontSize: 15.0, color: Theme.of(context).accentColor),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                flex: 2,
              ),
              Expanded(
                flex: 1,
                child: Image.network(urlPic),
              )
            ],
          )),
    );
  }
}
