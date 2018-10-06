import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // app的根Widget
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // 这是设置的app主题
        // 运行后你可以看到app有一个蓝色的toobar，并且在不退出app的情况下修改代码会热更新
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

// 这是应用中一个基类，继承自StateFulWidget，意味着这个类拥有一个state对象，该对象里的一些字段会影响app的UI
// 这个类是state的一些配置项。通过构造函数来获取值，这个值一般在State中消费，并且使用final关键字。其实类似于react中的defaultProps

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // setState方法告诉Flutter，这个State中有些值发生了变化，以便及时将新值更新到UI上，
      // 如果我不通过setState更改_count字段，那么Flutter并不会调用build匿名函数去更新界面
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // build方法会在每次setState的时候重新运行，例如上面的_incrementCounter方法被调用
    //Flutter已经被优化了重新构建的方法，所以你只会去更新需要去更新的部分，不必去单独更新里面的一些更细小的widget，类似于React中diff
    return new Scaffold(
      appBar: new AppBar(
        // 这里我们使用从App.build方法中初始化MyHomePage时候传入的title值来设置我们的title
        title: new Text(widget.title),
      ),
      body: new Center(
        // Center是一个布局Widget，他只有一个child（区分row or cloumn等是children），并且会将child的widget居中显示
        child: new Column(
          // Column也是一个布局widget，他可以有多个子widget
          // Column 有很多的属性去控制他的大小以及子widget的位置，这里我们使用mainAxisAlignment来让children在垂直线上居中，
          // 这里的主轴就是垂直的，因为Column就是垂直方向的，这里可以大概想象为display:flex，flex-directions:column,align-item,justifyContent。。。
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'Hello World!',
              style:TextStyle(
                fontSize:24.0,
                color: Colors.redAccent,
                decorationStyle:TextDecorationStyle.dotted,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.underline
              )
            ),
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),//最后这个逗号有利于格式化代码
    );
  }
}
