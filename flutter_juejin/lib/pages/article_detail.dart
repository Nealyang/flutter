import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class ArticleDetail extends StatefulWidget {
  final String articleUrl;
  final String title;
  ArticleDetail(this.articleUrl, this.title);
  _ArticleDetailState createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  bool hasLoaded = false;
  final flutterWebViewPlugin = new FlutterWebviewPlugin();

  @override
  void initState() {
    flutterWebViewPlugin.onStateChanged.listen((state) {
      if (state.type == WebViewState.finishLoad) {//有掘金web版本详情页的finished触发时间实在太长，所以这里就省略了hasLoaded的处理,其实也就是为了界面更友好
        setState(() {
          hasLoaded = true;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: widget.articleUrl,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      withZoom: false,
      withLocalStorage: true,
      withJavascript: true,
    );
  }
}
