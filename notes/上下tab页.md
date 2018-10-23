## 上下tab页

[代码地址](https://github.com/Nealyang/flutter/blob/a25b942d55/flutter_app/lib/pages/home_page.dart?1539088717069)

![img](https://github.com/Nealyang/flutter/blob/a25b942d55/images/tab_tabView.gif?1539088767051)

### 关键点

- [TabController](https://docs.flutter.io/flutter/material/TabController-class.html)

这是Tab页的控制器，用于定义Tab标签和内容页的坐标，还可配置标签页的切换动画效果等。TabController一般放入有状态控件中使用，以适应标签页数量和内容有动态变化的场景，如果标签页在APP中是静态固定的格局，则可以在无状态控件中加入简易版的DefaultTabController以提高运行效率，毕竟无状态控件要比有状态控件更省资源，运行效率更快。

- [TabBar](https://docs.flutter.io/flutter/material/TabBar-class.html)

Tab页的Title控件，切换Tab页的入口，一般放到AppBar控件下使用，内部有*Title属性。其子元素按水平横向排列布局，如果需要纵向排列，请使用Column或ListView控件包装一下。子元素为Tab类型的数组。

- [TabBarView](https://docs.flutter.io/flutter/material/TabBarView-class.html)

Tab页的内容容器，其内放置Tab页的主体内容。子元素可以是多个各种类型的控件

### 页面结构

![img](https://img.alicdn.com/tfs/TB1SpF2gMHqK1RjSZFkXXX.WFXa-1240-637.png)

### 关键代码

```
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

```

```
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
```

```
import 'package:flutter/material.dart';

class TabPage2 extends StatelessWidget {
  final List<Tab> myTabs = <Tab>[
    new Tab(text: 'LEFT'),
    new Tab(text: 'RIGHT'),
  ];

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: myTabs.length,
      child: new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.orangeAccent,
          title: new TabBar(
            tabs: myTabs,
            indicatorColor: Colors.white,
          ),
        ),
        body: new TabBarView(
          children: myTabs.map((Tab tab) {
            return new Center(child: new Text(tab.text));
          }).toList(),
        ),
      ),
    );
  }
}
```
