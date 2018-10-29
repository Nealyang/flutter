import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  // 菜单文本前面的图标大小
  static const double IMAGE_WIDTH = 30.0;
  static const double ARROW_ICON_WIDTH = 16.0;

  Image rightArrowIcon = Image.asset('images/ic_arrow_right.png',
      width: ARROW_ICON_WIDTH, height: ARROW_ICON_WIDTH);

  // 菜单文本
  List menuTitles = ['发布动弹', '动弹小黑屋', '关于', '设置'];

  // 菜单文本前的icon
  List menuIcons = [
    './images/leftmenu/ic_fabu.png',
    './images/leftmenu/ic_xiaoheiwu.png',
    './images/leftmenu/ic_about.png',
    './images/leftmenu/ic_settings.png'
  ];

  // 菜单文本样式
  TextStyle menuStyle = TextStyle(
    fontSize: 15.0,
  );

  Widget getIconImage(path) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(2.0, 0.0, 6.0, 0.0),
      child: Image.asset(path, width: 28.0, height: 28.0),
    );
  }

  Widget renderRow(BuildContext context, int index) {
    if (index == 0) {
      Image img = Image.asset(
        'images/cover_img.jpg',
        width: 304.0,
        height: 304.0,
      );
      return Container(
        width: 304.0,
        height: 304.0,
        margin: const EdgeInsets.only(bottom: 10.0),
        child: img,
      );
    }
    // 舍去封面图
    index -= 1;
    if (index.isOdd) {
      return Divider();
    }
    // 偶数，除以二取整，渲染单个item
    index = index ~/ 2;
    Padding listItemContent = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Row(
        children: <Widget>[
          getIconImage(menuIcons[index]),
          Expanded(
            child: Text(
              menuTitles[index],
              style: menuStyle,
            ),
          ),
          rightArrowIcon,
        ],
      ),
    );

    return InkWell(
      child: listItemContent,
      onTap: () {
        print('click list item $index');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(width: 304.0), //侧边栏宽度
      child: Material(
        elevation: 16.0, //阴影大小
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: ListView.builder(
            itemCount: menuTitles.length * 2 - 1,
            itemBuilder: renderRow,
          ),
        ),
      ),
    );
  }
}
