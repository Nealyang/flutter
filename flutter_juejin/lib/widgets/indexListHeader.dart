import 'package:flutter/material.dart';

class IndexListHeader extends StatelessWidget {
  final bool hasLogin;

  IndexListHeader(this.hasLogin);

  @override
  Widget build(BuildContext context) {
    if (hasLogin) {
    } else {}
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '热门文章',
                style: TextStyle(
                  color: Color(0xFF434343),
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              FlatButton(
                child: Text('查看更多', style: TextStyle(color: Color(0xFF757575))),
                onPressed: () {
                  print('查看更多');
                },
              )
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
