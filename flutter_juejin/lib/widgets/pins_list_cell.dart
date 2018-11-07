import 'package:flutter/material.dart';
import '../model/pins_cell.dart';
import './pins_cell_header.dart';
import './pins_cell_link.dart';
import './pins_cell_pic.dart';
import './pins_cell_url.dart';

class PinsListCell extends StatefulWidget {
  final PinsCell pinsCell;

  PinsListCell({Key key, this.pinsCell}) : super(key: key);

  _PinsListCellState createState() => _PinsListCellState();
}

class _PinsListCellState extends State<PinsListCell> {
  
  TextStyle _textStyle = TextStyle(color: Colors.black);

  List<Widget> _buildContent(String content){
    List<Widget> contentList = new List();
    RegExp url = new RegExp(r"((https|http|ftp|rtsp|mms)?:\/\/)[^\s]+");  
    List listString = content.split(url);
    List listUrl = new List();
    Iterable<Match> matches = url.allMatches(content);
    int urlIndex = 0;
    for(Match m in matches){
      listUrl.add(m.group(0));
    }
    for(var i = 0;i<listString.length;i++){
      if(listString[i] == ''){
        // 空字符串说明应该填充Url
        contentList.add(PinsCellLink(linkUrl: listUrl[urlIndex],));
        urlIndex+=1;
      }else{
        contentList.add(Text(listString[i],style:_textStyle));
      }
    }
    print(listString);
    print(listUrl);
    return contentList;
  }

  Widget _renderContent(String content) {
    return Wrap(
      // maxHeight: 300,
      direction: Axis.horizontal,
      spacing: 10.0,
      children: _buildContent(content),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.white,
          margin: const EdgeInsets.only(top: 10.0),
          padding: const EdgeInsets.symmetric(horizontal: 9.0),
          child: Column(
            children: <Widget>[
              PinsCellHeader(
                  userInfo: widget.pinsCell.user,
                  createdAt: widget.pinsCell.createdAt),
              _renderContent(widget.pinsCell.content),
              widget.pinsCell.url == ''?PinsCellPic():PinsCellUrl(),
            ],
          ),
        )
      ],
    );
  }
}
