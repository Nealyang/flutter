import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:event_bus/event_bus.dart';

import './index_page.dart';
import './pins_page.dart';
import './book_page.dart';
import './repos_page.dart';
import './activity_page.dart';
import '../routers/routes.dart';
import '../routers/application.dart';
import '../widgets/login-button.dart';
import '../event/event-bus.dart';
import '../event/event-model.dart';

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  _MyAppState() {
    final router = new Router();
    final eventBus = new EventBus();
    Routes.configureRoutes(router);
    Application.router = router;
    ApplicationEvent.event = eventBus;
  }

  final TextStyle tabTextStyleNormal =
      TextStyle(color: const Color(0xffdddddd));
  final TextStyle tabTextStyleSelected =
      TextStyle(color: const Color(0xff4d91fd));
  TabController _tabController;

  String _userName = '';
  String _userPic = '';

  // 底部bar
  final List<Tab> _bottomTabs = <Tab>[
    Tab(
      text: '首页',
      icon: Icon(Icons.home),
    ),
    Tab(
      text: '沸点',
      icon: Icon(Icons.chat),
    ),
    Tab(
      text: '小册',
      icon: Icon(Icons.book),
    ),
    Tab(
      text: '开源库',
      icon: Icon(Icons.bubble_chart),
    ),
    Tab(
      text: '活动',
      icon: Icon(Icons.local_activity),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: _bottomTabs.length);
    ApplicationEvent.event.on<UserLoginEvent>().listen((event) {
      setState(() {
        _userName = event.userName;
        _userPic = event.userPic;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: const Color.fromRGBO(77, 145, 253, 1.0),
          accentColor: const Color(0xFFB2BAC2),
        ),
        home: Scaffold(
          appBar: AppBar(
            leading: Image.asset(
              'images/logo.png',
            ),
            backgroundColor: Colors.white,
            title: Text('Flutter 版 web 掘金'),
            actions: <Widget>[
              LoginButton(
                userName: _userName,
                userPic: _userPic,
              ),
            ],
          ),
          body: TabBarView(
            controller: _tabController,
            children: <Widget>[
              IndexPage(),
              PinsPage(),
              BookPage(),
              ReposPage(),
              ActivityPage()
            ],
          ),
          bottomNavigationBar: new Material(
            color: Theme.of(context).primaryColor,
            child: TabBar(
              tabs: _bottomTabs,
              controller: _tabController,
              indicatorColor: Colors.white,
            ),
          ),
        ),
        onGenerateRoute: Application.router.generator,
      ),
    );
  }
}
