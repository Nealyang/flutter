import 'package:flutter/material.dart';
import '../util/data_utils.dart';
import '../model/pins_cell.dart';
import '../widgets/pins_list_cell.dart';
import '../widgets/load_more.dart';

class PinsPage extends StatefulWidget {
  _PinsPageState createState() => _PinsPageState();
}

class _PinsPageState extends State<PinsPage> {
  List<PinsCell> _listData = new List();

  Map<String, dynamic> _params = {
    "src": 'web',
    "uid": "",
    "limit": 20,
    "device_id": "",
    "token": ""
  };
  bool _isRequesting = false; //是否正在请求数据的flag
  bool _hasMore = true;
  String before = '';
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    getPinsList(false);
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('loadMore');
        getPinsList(true);
      }
    });
  }

  void getPinsList(bool isLoadMore) {

    if (_isRequesting || !_hasMore) return;

    if (before != '') {
      _params['before'] = before;
    }
    if(!isLoadMore){
      _params['before'] = '';
    }
    _isRequesting = true;
    before = DateTime.now().toString().replaceFirst(RegExp(r' '), 'T') + 'Z';
    DataUtils.getPinsListData(_params).then((resultData) {
      List<PinsCell> resultList = new List();
      if(isLoadMore){
        resultList.addAll(_listData);
      }
      resultList.addAll(resultData);
      setState(() {
        _listData = resultList;
        _hasMore = resultData.length != 0;
        _isRequesting = false;
      });
    });
  }

  Widget _itemBuilder(context, index) {
    if (index == _listData.length) {
      return LoadMore(_hasMore);
    }
    return PinsListCell(pinsCell: _listData[index]);
  }

  @override
  Widget build(BuildContext context) {
    if (_listData.length > 0) {
      return Container(
        color: Color(0xFFF4F5F5),
        child: ListView.builder(
          itemCount: _listData.length + 1,
          itemBuilder: _itemBuilder,
          controller: _scrollController,
        ),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
