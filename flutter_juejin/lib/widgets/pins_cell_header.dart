import 'package:flutter/material.dart';
import './in_text_dot.dart';

class PinsCellHeader extends StatelessWidget {
  final Map<String, dynamic> userInfo;
  final String createdAt;

  PinsCellHeader({Key key, this.userInfo, this.createdAt}) : super(key: key);

  List<Widget> _buildUserInfo() {
    List<Widget> infoList = new List();
    const TextStyle defaultStyle = TextStyle(
      color: Color(0xFFB2BAC2),
    );
    if (userInfo['jobTitle'] != '' || userInfo['jobTitle'] != null) {
      infoList.add(Text(
        userInfo['jobTitle'],
        style: defaultStyle,
      ));
    }
    if (userInfo['company'] != '' || userInfo['company'] != null) {
      infoList.add(Container(
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Text(
          '@',
          style: defaultStyle,
        ),
      ));

      infoList.add(LimitedBox(
        maxWidth: 100.0,
        child: Text(
          userInfo['company'],
          style: defaultStyle,
          overflow: TextOverflow.ellipsis,
        ),
      ));
    }

    infoList.add(InTextDot());
    infoList.add(Text(
      createdAt,
      style: defaultStyle,
    ));

    return infoList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 50.0,
              width: 50.0,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  userInfo['avatarLarge'],
                  scale: 2.0,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 7.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                userInfo['userName'],
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4.0),
              Row(
                children: _buildUserInfo(),
              )
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                PopupMenuButton(
                  icon: Icon(
                    Icons.more_horiz,
                    color: Theme.of(context).accentColor,
                  ),
                  onSelected: (value) {
                    print(value);
                  },
                  itemBuilder: (BuildContext context) => <PopupMenuItem>[
                        PopupMenuItem(
                          value: '举报',
                          child: Text('举报'),
                        ),
                      ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
