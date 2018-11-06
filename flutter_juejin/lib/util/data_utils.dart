import 'dart:convert';
import '../model/index_cell.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async' show Future;
import '../api/api.dart';
import './net_utils.dart';
import '../model/pins_cell.dart';

class DataUtils {
  static Future<String> _loadPinsListAsset() async {
    return await rootBundle.loadString('assets/pins.json');
  }

  static Future<List<PinsCell>> getPinsListData() async {
    List<PinsCell> resultList = new List();
    String jsonString = await _loadPinsListAsset();
    final jsonResponseList = json.decode(jsonString)['d']['list'];
    for (int i = 0; i < jsonResponseList.length; i++) {
      PinsCell pinsCell;
      try {
        pinsCell = PinsCell.fromJson(jsonResponseList[i]);
      } catch (e) {
        print("error $e at $i");
        continue;
      }
      resultList.add(pinsCell);
    }

    return resultList;
  }

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
