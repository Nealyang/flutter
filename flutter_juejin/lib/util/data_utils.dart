import 'dart:convert';
import '../model/index_cell.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async' show Future;
import '../api/api.dart';
import './net_utils.dart';
import '../model/pins_cell.dart';
import '../model/book_cell.dart';
import '../model/book_nav.dart';
import '../model/repos_cell.dart';
import '../model/activity_cell.dart';
import '../model/activity_nav.dart';

class DataUtils {
  static Future<String> _loadPinsListAsset() async {
    return await rootBundle.loadString('assets/pins.json');
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

  // 沸点 列表

  static Future<List<PinsCell>> getPinsListData(
      Map<String, dynamic> params) async {
    List<PinsCell> resultList = new List();
    var response = await NetUtils.get(Api.PINS_LIST, params: params);
    var responseList = response['d']['list'];
    for (int i = 0; i < responseList.length; i++) {
      PinsCell pinsCell;
      try {
        pinsCell = PinsCell.fromJson(responseList[i]);
      } catch (e) {
        print("error $e at $i");
        continue;
      }
      resultList.add(pinsCell);
    }

    return resultList;
  }

  // 获取小册导航栏
  static Future<List<BookNav>> getBookNavData() async {
    List<BookNav> resultList = [];
    var response = await NetUtils.get(Api.BOOK_NAV);
    var responseList = response['d'];
    for (int i = 0; i < responseList.length; i++) {
      BookNav bookNav;
      try {
        bookNav = BookNav.fromJson(responseList[i]);
      } catch (e) {
        print("error $e at $i");
        continue;
      }
      resultList.add(bookNav);
    }

    return resultList;
  }

  // 获取小册
  static Future<List<BookCell>> getBookListData(
      Map<String, dynamic> params) async {
    List<BookCell> resultList = new List();
    var response = await NetUtils.get(Api.BOOK_LIST, params: params);
    var responseList = response['d'];
    for (int i = 0; i < responseList.length; i++) {
      BookCell bookCell;
      try {
        bookCell = BookCell.fromJson(responseList[i]);
      } catch (e) {
        print("error $e at $i");
        continue;
      }
      resultList.add(bookCell);
    }

    return resultList;
  }

  // 开源库
  static Future<List<ReposCell>> getReposListData(
      Map<String, dynamic> params) async {
    List<ReposCell> resultList = new List();
    var response = await NetUtils.get(Api.REPOS_LIST, params: params);
    var responseList = response['d']['repoList'];
    for (int i = 0; i < responseList.length; i++) {
      ReposCell reposCell;
      try {
        reposCell = ReposCell.fromJson(responseList[i]);
      } catch (e) {
        print("error $e at $i");
        continue;
      }
      resultList.add(reposCell);
    }

    return resultList;
  }

  // 活动城市列表
  static Future<List<ActivityNav>> getActivityNavList(Map<String,dynamic> params) async{
    List<ActivityNav> resultList = [];
    var response = await NetUtils.get(Api.ACTIVITY_CITY,params: params);
    var responseList = response['d'];
    for (int i = 0; i < responseList.length; i++) {
      ActivityNav activityNav;
      try {
        activityNav = ActivityNav.fromJson(responseList[i]);
      } catch (e) {
        print("error $e at $i");
        continue;
      }
      resultList.add(activityNav);
    }
     return resultList;
  }

  // 活动列表
    static Future<List<ActivityCell>> getActivityList(Map<String,dynamic> params) async{
    List<ActivityCell> resultList = [];
    var response = await NetUtils.get(Api.ACTIVITY_LIST,params: params);
    var responseList = response['d'];
    for (int i = 0; i < responseList.length; i++) {
      ActivityCell activityCell;
      try {
        activityCell = ActivityCell.formJson(responseList[i]);
      } catch (e) {
        print("error $e at $i");
        continue;
      }
      resultList.add(activityCell);
    }
     return resultList;
  }
}
