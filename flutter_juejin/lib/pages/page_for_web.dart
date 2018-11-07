import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class PageForWeb extends StatelessWidget {

  final String articleUrl;
  final String title;
  PageForWeb(this.articleUrl, this.title);

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: articleUrl,
      appBar: AppBar(
        title: Text(title),
      ),
      withZoom: false,
      withLocalStorage: true,
      withJavascript: true,
    );;
  }
}
