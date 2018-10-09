import 'package:flutter/material.dart';

import './drawer_page.dart';
import './TopTabPage/TopTabPage_1.dart';
import './TopTabPage/TopTabPage_2.dart';
import './TopTabPage/TopTabPage_3.dart';
import './TopTabPage/TopTabPage_4.dart';

class HomePage extends StatefulWidget{
  @override 
  _HomePageState createState()=>new _HomePageState();
}
//用于使用到了一点点的动画效果，因此加入了SingleTickerProviderStateMixin
class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  TabController _tabController;

// 底部bar
  final List<Tab> _bottomTabs = <Tab>[
    new Tab(text:'home',icon:new Icon(Icons.home)),
    new Tab(text:'book',icon:new Icon(Icons.book)),
    new Tab(text:'movie',icon:new Icon(Icons.movie)),
    new Tab(text:'music_video',icon:new Icon(Icons.music_video)),
  ];


  @override
  void initState(){
    super.initState();
    _tabController = new TabController(
      vsync:this,
      length:_bottomTabs.length
    );
  }

  @override
  void dispose(){
    _tabController .dispose();
    super.dispose();
  }

 @override
  Widget build (BuildContext context){
    return new Scaffold(
      appBar:new AppBar(
        title:new Text('flutter app'),
        backgroundColor:Colors.blue[400]
      ),
      drawer: new Drawer(
        child: new DrawerPage(),
      ),
      body: new TabBarView(
        controller:_tabController,
        children: <Widget>[
          new TabPage1(data:'参数值'),
          new TabPage2(),
          new TabPage3(),
          new TabPage4(),
        ],
      ),
      bottomNavigationBar: new Material(
        color:Colors.lightBlueAccent,
        child:new TabBar(
          controller:_tabController,
          tabs:_bottomTabs,
          indicatorColor:Colors.white,//tab标签下划线颜色
        )
      ),
    );
  }

}
