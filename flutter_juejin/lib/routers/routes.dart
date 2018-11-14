import './router_handler.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class Routes {
  static String root = '/';
  static String articleDetail = "/detail";
  static String webViewPage = '/web';
  static String swipPage = '/swip';
  static String loginPage = '/login';

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });

    router.define(articleDetail, handler: articleDetailHandler);
    router.define(webViewPage, handler: webPageHandler);
    router.define(swipPage,handler: swipPageHandler);
    router.define(loginPage,handler: loginPageHandler);
  }
}
