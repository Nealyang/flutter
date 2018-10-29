import 'package:flutter/material.dart';

class SlideView extends StatefulWidget {
  final data;
  SlideView({Key key, this.data}) : super(key: key);
  _SlideViewState createState() => _SlideViewState();
}

class _SlideViewState extends State<SlideView>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
        length: widget.data == null ? 0 : widget.data.length, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    if (widget.data != null && widget.data.length > 0) {
      widget.data.forEach((item) {
        items.add(GestureDetector(
          onTap: () {
            print('点击跳转到详情页');
          },
          child: Stack(
            children: <Widget>[
              Image.network(item['imgUrl']),
              Container(
                padding: const EdgeInsets.all(6.0),
                width: MediaQuery.of(context).size.width,
                color: const Color(0x50000000),
                child: Text(
                  item['title'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              )
            ],
          ),
        ));
      });
    }
    return TabBarView(
      controller: tabController,
      children:items
    );
  }
}
