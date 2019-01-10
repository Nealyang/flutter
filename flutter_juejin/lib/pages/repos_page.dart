import 'package:flutter/material.dart';
import '../util/data_utils.dart';
import '../model/repos_cell.dart';
import '../constants/constants.dart';
import '../widgets/repos_list_cell.dart';
import '../widgets/load_more.dart';
import 'dart:core';
import '../widgets/repos_cell_header.dart';
class ReposPage extends StatefulWidget {
  _ReposPageState createState() => _ReposPageState();
}

class _ReposPageState extends State<ReposPage> with AutomaticKeepAliveClientMixin{
  List<ReposCell> _listData = <ReposCell>[];
  int _indexPage = 0;
  Map<String, dynamic> _params = {"src": 'web', "limit": 20};
  bool _hasMore = true;
  ScrollController _scrollController = ScrollController();
   bool _isRequesting = false;

  @override
    // TODO: implement wantKeepAlive
    bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _getListData(false);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getListData(true);
      }
    });
  }

  _getListData(bool isLoadMore) {
    if (_isRequesting || !_hasMore) return;
    if (isLoadMore) {
      _params['before'] = Constants.REPOS_BEFOR[_indexPage];
    }else{
      _indexPage = -1;
    }
    _isRequesting = true;
    DataUtils.getReposListData(_params).then((resultData) {
      if (this.mounted) {
        _indexPage+=1;
        List<ReposCell> resultList = [];
        if (isLoadMore) {
          resultList.addAll(_listData);
        }
        resultList.addAll(resultData);

        setState(() {
          _listData = resultList;
          _hasMore = _indexPage < Constants.REPOS_BEFOR.length;
          _isRequesting = false;
        });
      }
    });
  }

  @override
  void dispose() { 
    _scrollController.dispose();
    super.dispose();
  }

  Widget _itemBuilder(context,index){
    if(index == _listData.length+1){
      return LoadMore(_hasMore);
    }
    if(index == 0){
      return ReposCellHeader();
    }
    return ReposListCell(cellData: _listData[index-1]);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
      itemBuilder: _itemBuilder,
      itemCount: _listData.length+2,
      controller: _scrollController,
    );
  }
}
