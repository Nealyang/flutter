import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../routers/application.dart';

class SwipPage extends StatelessWidget {
  final String pics;
  final String currentIndex;

  SwipPage({Key key, this.pics, this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List picList = pics.split(',');
    int index = int.parse(currentIndex);
    return Center(
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return new Image.network(
              picList[index],
              fit: BoxFit.fitWidth,
              width: MediaQuery.of(context).size.width,
            );
          },
          itemCount: picList.length,
          scale: 0.8,
          pagination: new SwiperPagination(),
          index: index,
          onTap: (index) {
            Application.router.pop(context);
          },
        ),
      );
  }
}
