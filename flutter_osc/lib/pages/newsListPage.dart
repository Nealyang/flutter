import 'package:flutter/material.dart';
import 'dart:async';
import '../util/netUtils.dart';
import '../api/api.dart';
import 'dart:convert';
import '../constants/constants.dart';
import '../widgets/commonEndLine.dart';
import './newDetailPage.dart';
import '../widgets//slideView.dart';

class NewsListPage extends StatelessWidget {
  List<Map> slideData = [];
  List<Map> listData = [];

  TextStyle titleTextStyle = TextStyle(fontSize: 15.0);
  TextStyle subtitleStyle =
      TextStyle(color: const Color(0xFFB6BDC0), fontSize: 12.0);

  NewsListPage() {
    // 数据初始化
    for (int i = 0; i < 3; i++) {
      Map map = new Map();
      map['title'] = '这是一个测试title';
      map['detailUrl'] = 'https://www.oschina.net/news/98455/guido-van-rossum-resigns';
      // 轮播图的图片URL
      map['imgUrl'] = 'https://static.oschina.net/uploads/img/201807/30113144_1SRR.png';
      slideData.add(map);
    }
    for (int i = 0; i < 30; i++) {
      Map map = new Map();
      // 列表item的标题
      map['title'] = 'J2Cache 2.3.23 发布，支持 memcached 二级缓存';
      // 列表item的作者头像URL
      map['authorImg'] =
          'https://static.oschina.net/uploads/user/0/12_50.jpg?t=1421200584000';
      // 列表item的时间文本
      map['timeStr'] = '2018/7/30';
      // 列表item的资讯图片
      map['thumb'] =
          'https://static.oschina.net/uploads/logo/j2cache_N3NcX.png';
      // 列表item的评论数
      map['commCount'] = 5;
      listData.add(map);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listData.length * 2 + 1,
      itemBuilder: (BuildContext context, int index) {
        return renderRow(index);
      },
    );
  }

  // 渲染列表item
  Widget renderRow(i) {
    // i为0时渲染轮播图
    if (i == 0) {
      return new Container(
        height: 180.0,
        child: new SlideView(data:slideData),
      );
    }
    // i > 0时
    i -= 1;
    // i为奇数，渲染分割线
    if (i.isOdd) {
      return new Divider(height: 1.0);
    }
    // 将i取整
    i = i ~/ 2;
    // 得到列表item的数据
    var itemData = listData[i];
    // 代表列表item中的标题这一行
    var titleRow = new Row(
      children: <Widget>[
        // 标题充满一整行，所以用Expanded组件包裹
        new Expanded(
          child: new Text(itemData['title'], style: titleTextStyle),
        )
      ],
    );
    // 时间这一行包含了作者头像、时间、评论数这几个
    var timeRow = new Row(
      children: <Widget>[
        // 这是作者头像，使用了圆形头像
        new Container(
          width: 20.0,
          height: 20.0,
          decoration: new BoxDecoration(
            // 通过指定shape属性设置图片为圆形
            shape: BoxShape.circle,
            color: const Color(0xFFECECEC),
            image: new DecorationImage(
              image: new NetworkImage(itemData['authorImg']), fit: BoxFit.cover),
            border: new Border.all(
              color: const Color(0xFFECECEC),
              width: 2.0,
            ),
          ),
        ),
        // 这是时间文本
        new Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          child: new Text(
            itemData['timeStr'],
            style: subtitleStyle,
          ),
        ),
        // 这是评论数，评论数由一个评论图标和具体的评论数构成，所以是一个Row组件
        new Expanded(
          flex: 1,
          child: new Row(
            // 为了让评论数显示在最右侧，所以需要外面的Expanded和这里的MainAxisAlignment.end
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new Text("${itemData['commCount']}", style: subtitleStyle),
              new Image.asset('./images/ic_comment.png', width: 16.0, height: 16.0),
            ],
          ),
        )
      ],
    );
    var thumbImgUrl = itemData['thumb'];
    // 这是item右侧的资讯图片，先设置一个默认的图片
    var thumbImg = new Container(
      margin: const EdgeInsets.all(10.0),
      width: 60.0,
      height: 60.0,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFFECECEC),
        image: new DecorationImage(
          image: new ExactAssetImage('./images/ic_img_default.jpg'),
          fit: BoxFit.cover),
        border: new Border.all(
          color: const Color(0xFFECECEC),
          width: 2.0,
        ),
      ),
    );
    // 如果上面的thumbImgUrl不为空，就把之前thumbImg默认的图片替换成网络图片
    if (thumbImgUrl != null && thumbImgUrl.length > 0) {
      thumbImg = new Container(
        margin: const EdgeInsets.all(10.0),
        width: 60.0,
        height: 60.0,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFFECECEC),
          image: new DecorationImage(
              image: new NetworkImage(thumbImgUrl), fit: BoxFit.cover),
          border: new Border.all(
            color: const Color(0xFFECECEC),
            width: 2.0,
          ),
        ),
      );
    }
    // 这里的row代表了一个ListItem的一行
    var row = new Row(
      children: <Widget>[
        // 左边是标题，时间，评论数等信息
        new Expanded(
          flex: 1,
          child: new Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Column(
              children: <Widget>[
                titleRow,
                new Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                  child: timeRow,
                )
              ],
            ),
          ),
        ),
        // 右边是资讯图片
        new Padding(
          padding: const EdgeInsets.all(6.0),
          child: new Container(
            width: 100.0,
            height: 80.0,
            color: const Color(0xFFECECEC),
            child: new Center(
              child: thumbImg,
            ),
          ),
        )
      ],
    );
    // 用InkWell包裹row，让row可以点击
    return new InkWell(
      child: row,
      onTap: () {
      },
    );
  }
}
