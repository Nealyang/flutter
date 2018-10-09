import 'package:flutter/material.dart';

class TabPage1 extends StatefulWidget{
  TabPage1({Key key,this.data}):super(key:key);

  // TabPage1({ Key key , this.data}) : super(key: key)
  
  final String data;

  @override
  _MyTabPageState createState()=>new _MyTabPageState();
}

class _MyTabPageState extends State<TabPage1> with SingleTickerProviderStateMixin{
  final List<Tab> myTabs = <Tab>[
    new Tab(text: 'Tab1'),
    new Tab(text: 'Tab2'),
    new Tab(text: 'Tab3'),
    new Tab(text: 'Tab4'),
    new Tab(text: 'Tab5'),
    new Tab(text: 'Tab6'),
    new Tab(text: 'Tab7'),
    new Tab(text: 'Tab8'),
    new Tab(text: 'Tab9'),
    new Tab(text: 'Tab10'),
    new Tab(text: 'Tab11'),
  ];

  TabController _tabController;

  @override
  void initState(){
    super.initState();
    _tabController = new TabController(
      vsync:this,
      length:myTabs.length
    );
  }

  @override
  void dispose(){
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar:AppBar(
        backgroundColor:Colors.orangeAccent,
        title:new TabBar(
          controller:_tabController,
          tabs:myTabs,
          indicatorColor:Colors.white,
          isScrollable:true,//水平滚动开关，开启后Tab标签可自适应宽度并且可以横向拉动，关闭后每一个tab自动压缩，总长为屏幕宽度
        )
      ),
      body:new TabBarView(
        controller:_tabController,
        children:myTabs.map((Tab tab){
          return new Center(
            child:new Text(tab.text+'  '+widget.data)
          );
        }).toList()
      )
    );
  }
}