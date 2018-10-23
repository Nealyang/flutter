import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';  

import 'package:http/http.dart' as http;    //用这个发起http请求很方便

class News extends StatefulWidget {
  const News({ Key key , this.data}) : super(key: key); //构造函数中增加参数
  final String data;    //为参数分配空间
  @override
  _MyTabbedPageState createState() => new _MyTabbedPageState();
}

//定义TAB页对象，这样做的好处就是，可以灵活定义每个tab页用到的对象，可结合Iterable对象使用，以后讲
class NewsTab {
  String text;
  NewsList newsList;
  NewsTab(this.text,this.newsList);
}

class _MyTabbedPageState extends State<News> with SingleTickerProviderStateMixin {

  //将每个Tab页都结构化处理下，由于http的请求需要传入新闻类型的参数，因此将新闻类型参数值作为对象属性传入Tab中
  final List<NewsTab> myTabs = <NewsTab>[
    new NewsTab('头条',new NewsList(newsType: 'toutiao')),    //拼音就是参数值
    new NewsTab('社会',new NewsList(newsType: 'shehui')),
    new NewsTab('国内',new NewsList(newsType: 'guonei')),
    new NewsTab('国际',new NewsList(newsType: 'guoji')),
    new NewsTab('娱乐',new NewsList(newsType: 'yule')),
    new NewsTab('体育',new NewsList(newsType: 'tiyu')),
    new NewsTab('军事',new NewsList(newsType: 'junshi')),
    new NewsTab('科技',new NewsList(newsType: 'keji')),
    new NewsTab('财经',new NewsList(newsType: 'caijing')),
    new NewsTab('时尚',new NewsList(newsType: 'shishang')),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: myTabs.length);
  }

 @override
 void dispose() {
   _tabController.dispose();
   super.dispose();
 }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.orangeAccent,
        title: new TabBar(
          controller: _tabController,
          tabs: myTabs.map((NewsTab item){      //NewsTab可以不用声明
            return new Tab(text: item.text==null?'错误':item.text);
          }).toList(),
          indicatorColor: Colors.white,
          isScrollable: true,   //水平滚动的开关，开启后Tab标签可自适应宽度并可横向拉动，关闭后每个Tab自动压缩为总长符合屏幕宽度的等宽，默认关闭
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: myTabs.map((item) {
          return item.newsList; //使用参数值
        }).toList(),
      ),
    );
  }
}

//新闻列表
class NewsList extends StatefulWidget{
  final String newsType;    //新闻类型
  @override
  NewsList({Key key, this.newsType} ):super(key:key);

  _NewsListState createState() => new _NewsListState();
}

class _NewsListState extends State<NewsList>{

  final String _url = 'http://v.juhe.cn/toutiao/index?';
  List data;


  //直面Future对象的办法
  Future<String> get(String category) async {
    var httpClient = new HttpClient();
    var request = await httpClient.getUrl(Uri.parse('${_url}type=$category&key=3a86f36bd3ecac8a51135ded5eebe862'));
    var response = await request.close();
    return await response.transform(utf8.decoder).join();
  }

  getData() async{
    var res = await get(widget.newsType);   //注意await关键字
    setState(() {
      data = jsonDecode(res)['result']['data'];        
    });
  }

  @override
  void initState() {
    super.initState();
    // this.getSWData(widget.newsType); //避开Future的办法

    getData();  //直面Future对象的办法

  }

  @override
  Widget build(BuildContext context){
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (context, i) {
          return _newsRow(data[i]);//把数据项塞入ListView中
        }
      );
  }

  Widget _newsRow(newsInfo){
    return new Card(
      child: new Column(
        children: <Widget>[
          new Container(
            child: new ListTile(title:new Text(newsInfo["title"],textScaleFactor: 1.5,),) ,
            margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),),
          _generateItem(newsInfo),//根据图片数量返回对应样式的图片
          new Container(
            padding:const EdgeInsets.fromLTRB(25.0, 10.0, 0.0, 10.0),
            child:new Row(
              // textDirection: TextDirection.ltr,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Expanded(
                  child: new Text(newsInfo["author_name"]),
                ),
                new Expanded(
                  child: new Text(newsInfo["date"]),
                ),
              ],
          )),
          
        ],
      ),
    );
  }

  //根据获取到的图片数量控制图片的显示样式
  _generateItem(Map newsInfo) {
    if (newsInfo["thumbnail_pic_s"] != null &&
        newsInfo["thumbnail_pic_s02"] != null &&
        newsInfo["thumbnail_pic_s03"] != null) {
      return _generateThreePicItem(newsInfo);
    } else {
      return _generateOnePicItem(newsInfo);
    }
  }

  //仅有一个图片时的效果
  _generateOnePicItem(Map newsInfo){
    return new Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        new Expanded(
          child: new Container(
            padding: const EdgeInsets.all(3.0),
            child: new SizedBox(
              child: new Image.network(
                newsInfo['thumbnail_pic_s'],
                fit: BoxFit.fitWidth,
              ),
              height: 200.0,
            )
          )
        )
      ],
    );
  }

  //有三张图片时的效果
  _generateThreePicItem(Map newsInfo){
    return new Row(
      children: <Widget>[
        new Expanded(
            child: new Container(
                padding: const EdgeInsets.all(4.0),
                child: new Image.network(newsInfo['thumbnail_pic_s'])
            )
        ),
        new Expanded(
            child: new Container(
                padding: const EdgeInsets.all(4.0),
                child: new Image.network(newsInfo['thumbnail_pic_s02'])
            )
        ),
        new Expanded(
            child: new Container(
                padding: const EdgeInsets.all(4.0),
                child: new Image.network(newsInfo['thumbnail_pic_s03'])
            )
        )
      ],
    );
  }
}