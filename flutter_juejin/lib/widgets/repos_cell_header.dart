import 'package:flutter/material.dart';

class ReposCellHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 23.0),
      margin: const EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(
                  color: Theme.of(context).accentColor, width: 0.5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '推荐开源库',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          FlatButton.icon(
            textTheme: ButtonTextTheme.primary,
            icon: Icon(Icons.settings),
            label: Text('定制推荐',style: TextStyle(fontSize: 17.0),),
            onPressed: () {
              print('need login');
            },
          ),
        ],
      ),
    );
  }
}
