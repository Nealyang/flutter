import 'dart:convert';
import '../model/indexCell.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async' show Future;
import '../api/api.dart';
import './net_utils.dart';

class DataUtils {
  // static Future<String> _loadIndexListAsset() async {
  //   return await rootBundle.loadString('assets/indexListData.json');
  // }

  // static Future<List<IndexCell>> getIndexListData() async {
  //   List<IndexCell> resultList = new List();
  //   String jsonString = await _loadIndexListAsset();
  //   final jsonResponseList = json.decode(jsonString)['indexListData'];
  //   for (int i = 0; i < jsonResponseList.length; i++) {
  //     // resultList.add();
  //     IndexCell cellData = new IndexCell.fromJson(jsonResponseList[i]);
  //     resultList.add(cellData);
  //   }

  //   return resultList;
  // }

  // 首页列表数据
  static Future<List<IndexCell>> getIndexListData(
      Map<String, dynamic> params) async {
    var response = await NetUtils.get(Api.RANK_LIST, params: params);

    var responseList = response['d']['entrylist'];

    List<IndexCell> resultList = new List();
    for (int i = 0; i < responseList.length; i++) {
      try {
        IndexCell cellData = new IndexCell.fromJson(responseList[i]);
        resultList.add(cellData);
      } catch (e) {
        // No specified type, handles all
        print('Something really unknown: $i');
      }
    }

    return resultList;
  }
}
