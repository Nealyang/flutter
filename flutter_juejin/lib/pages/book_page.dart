import 'package:flutter/material.dart';
import '../util/data_utils.dart';
import './book_page_tab_view.dart';
import '../model/book_nav.dart';

class BookPage extends StatefulWidget {
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage>
    with SingleTickerProviderStateMixin {
  List<BookNav> _navData = new List();
  List<Tab> _myTabs = <Tab>[
    Tab(
      text: '全部',
    )
  ];
  List<BookPageTabView> _myTabView = <BookPageTabView>[
    BookPageTabView(
      alias: 'all',
    )
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    getNavList();
  }

  getNavList() {
    DataUtils.getBookNavData().then((resultData) {
      resultData.forEach((BookNav bn) {
        _myTabs.add(Tab(
          text: bn.name,
        ));
        _myTabView.add(BookPageTabView(
          alias: bn.alias,
        ));
      });
      if (this.mounted) {
        setState(() {
          _navData = resultData;
        });
        _tabController =
            new TabController(vsync: this, length: _navData.length + 1);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_navData.length == 0) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: new TabBar(
          controller: _tabController,
          tabs: _myTabs,
          indicatorColor: Colors.white,
          isScrollable: true,
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: _myTabView,
      ),
    );
  }
}
