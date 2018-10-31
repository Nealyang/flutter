import 'package:flutter/material.dart';
import '../widgets/indexListCell.dart';
import '../util/dataUtils.dart';
import '../model/indexCell.dart';

class IndexPage extends StatefulWidget {
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  List<IndexCell> _listData = new List();

  @override
  void initState() {
    super.initState();
    getList(false);
  }

  getList(bool isLoadMore) {
    DataUtils.getIndexListData().then((resultList) {
      setState(() {
        _listData = resultList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_listData.length);
    return Column(
      children: <Widget>[
        Text('IndexPage'),
        IndexListCell(cellInfo: _listData.length>0?_listData[0]:new Map())
      ],
    );
  }
}
