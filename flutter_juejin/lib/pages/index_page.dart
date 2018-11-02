import 'package:flutter/material.dart';
import '../widgets/index_list_cell.dart';
import '../util/dataUtils.dart';
import '../model/indexCell.dart';
import '../widgets/index_list_header.dart';

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

  _renderList(context , index){
    if(index == 0){
      return IndexListHeader(false);
    }
    return  IndexListCell(cellInfo: _listData[index-1]);
  }

  @override
  Widget build(BuildContext context) {
    print(_listData.length);
    if (_listData.length == 0) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return ListView.builder(
      itemCount: _listData.length+1,//添加一个header
      itemBuilder: (context,index)=> _renderList(context,index),
    );
  }
}
