import 'package:flutter/material.dart';
import '../util/data_utils.dart';
import '../model/activity_nav.dart';
import './activity_page_tab_view.dart';

class ActivityPage extends StatefulWidget {
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage>
    with SingleTickerProviderStateMixin {
  Map<String, dynamic> _params = {
    "uid": '',
    "client_id": "",
    "token": "",
    "src": "web"
  };
  List<ActivityNav> navList = [];
  List<ActivityPageTabView> _myTabView = <ActivityPageTabView>[
    ActivityPageTabView(
      alias: "",
    )
  ];
  List<Tab> _myTab = <Tab>[
    Tab(
      text: '全部',
    )
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _getNavList(false);
  }

  _getNavList(bool isLoadMore) {
    DataUtils.getActivityNavList(_params).then((resultData) {
      resultData.forEach((ele) {
        _myTab.add(Tab(
          text: ele.cityName,
        ));
        _myTabView.add(ActivityPageTabView(
          alias: ele.cityAlias,
        ));
      });
      if (this.mounted) {
        setState(() {
          navList = resultData;
        });
      }
      _tabController = TabController(vsync: this, length: navList.length + 1);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (navList.length == 0) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: new TabBar(
          tabs: _myTab,
          controller: _tabController,
          indicatorColor: Colors.white,
          isScrollable: true,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _myTabView,
      ),
    );
  }
}
