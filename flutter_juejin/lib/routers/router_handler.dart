import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/article_detail.dart';
import '../pages/page_for_web.dart';
import '../pages/swip_page.dart';

Handler articleDetailHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String articleUrl = params['id']?.first;
  String title = params['title']?.first;
  return ArticleDetail(articleUrl, title);
});

Handler webPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String articleUrl = params['url']?.first;
  String title = params['title']?.first;
  print('$articleUrl and  $title');
  return PageForWeb(articleUrl, title);
});

Handler swipPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String pics = params['pics']?.first;
  String index = params['currentIndex']?.first;
  print(pics);
  return SwipPage(pics: pics,currentIndex: index,);
});
