import 'package:flutter/material.dart';
import '../model/indexCell.dart';

class IndexListCell extends StatelessWidget {
  final IndexCell cellInfo;

  IndexListCell({Key key,this.cellInfo}):super(key : key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(cellInfo.username),
    );
  }
}