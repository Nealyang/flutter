import 'package:flutter/material.dart';

class ArticleDetail extends StatelessWidget {
  final String articleId;
  final String title;

  ArticleDetail(@required this.articleId, @required this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text("这篇文章的id是$articleId"),
      ),
    );
  }
}
