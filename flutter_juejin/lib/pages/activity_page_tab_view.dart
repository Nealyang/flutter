import 'package:flutter/material.dart';
import '../model/activity_cell.dart';
import '../util/data_utils.dart';
import '../widgets/activity_list_cell.dart';
import '../widgets/load_more.dart';

class ActivityPageTabView extends StatefulWidget {
  final String alias;
  ActivityPageTabView({Key key, this.alias}) : super(key: key);

  _ActivityPageTabViewState createState() => _ActivityPageTabViewState();
}

class _ActivityPageTabViewState extends State<ActivityPageTabView> {
  final Map<String, dynamic> _params = {
    "uid": "",
    "client_id": "",
    "token": "",
    "src": "web",
    "orderType": "startTime",
    "cityAlias": "",
    "pageNum": "",
    "pageSize": "",
  };
  List<ActivityCell> _cellList = [];
  bool _hasMore = true;
  bool _isRequesting = false;
  ScrollController _scrollController = ScrollController();

  void initState() {
    super.initState();
    _getList(false);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getList(true);
      }
    });
  }

  _getList(bool isLoadMore) {
    if (!_hasMore || _isRequesting) return;

    if (!isLoadMore) {
      _params['pageNum'] = 1;
    }

    _params['cityAlias']=widget.alias;

    DataUtils.getActivityList(_params).then((resultData) {
      List<ActivityCell> _mergeList = [];
      if (isLoadMore) {
        _mergeList.addAll(_cellList);
      }
      _mergeList.addAll(resultData);
      if (this.mounted) {
        setState(() {
          _cellList = _mergeList;
          _hasMore = resultData.length != 0;
        });
      }
      _params['pageNum'] = _params['pageNum'] + 1;

      // 发现有单页数据少于20的情况，当选择城市的时候
      if(resultData.length<20){
        _getList(true);
      }
    });
  }

  Widget _itemBuilder(context, index) {
    if (index == _cellList.length) {
      return LoadMore(_hasMore);
    }
    return ActivityListCell(
      cellData: _cellList[index],
    );
  }

  @override
  void dispose() { 
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_cellList.length == 0) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Container(
      color: Colors.black12,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _cellList.length + 1,
        itemBuilder: _itemBuilder,
      ),
    );
  }
}
