import 'package:flutter/material.dart';
import '../widgets/index_list_cell.dart';
import '../util/data_utils.dart';
import '../model/indexCell.dart';
import '../widgets/index_list_header.dart';
import '../constants/constants.dart';

const pageIndexArray = Constants.RANK_BEFORE;

class IndexPage extends StatefulWidget {
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  List<IndexCell> _listData = new List();
  int _pageIndex = 0;
  Map<String, dynamic> _params = {
    "src": 'web',
    "category": "all",
    "limit": 20
  };

  @override
  void initState() {
    super.initState();
    getList(false);
  }

  getList(bool isLoadMore) {
    if(!isLoadMore){
      // reload的时候重置page
      _pageIndex = 0;
    }
    _params['before'] = pageIndexArray[_pageIndex];

    DataUtils.getIndexListData(_params).then((result) {
     setState(() {
        _listData = result;
      });
    });
  }

  _renderList(context, index) {
    if (index == 0) {
      return IndexListHeader(false);
    }
    return IndexListCell(cellInfo: _listData[index - 1]);
  }

  @override
  Widget build(BuildContext context) {
    if (_listData.length == 0) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return ListView.builder(
      itemCount: _listData.length + 1, //添加一个header
      itemBuilder: (context, index) => _renderList(context, index),
    );
  }
}
