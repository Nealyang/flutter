import 'package:flutter/material.dart';

class GoodAndCommentCell extends StatelessWidget {
  final int collectionCount;
  final int commonentCount;

  GoodAndCommentCell(this.collectionCount, this.commonentCount);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: 20.0,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
            border:
                Border.all(color: Theme.of(context).accentColor, width: 1.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.favorite,
                size: 12.5,
                color: Theme.of(context).accentColor,
              ),
              Text(
                collectionCount == 0 ? '' : collectionCount.toString(),
                style: TextStyle(
                  fontSize: 11.5,
                  color: Theme.of(context).accentColor,
                ),
              )
            ],
          ),
        ),
        Container(
          height: 20.0,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Theme.of(context).accentColor, width: 1.0),
              left: BorderSide.none,
              right:
                  BorderSide(color: Theme.of(context).accentColor, width: 1.0),
              bottom:
                  BorderSide(color: Theme.of(context).accentColor, width: 1.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.speaker_notes,
                size: 12.5,
                color: Theme.of(context).accentColor,
              ),
              Text(
                commonentCount == 0 ? '' : commonentCount.toString(),
                style: TextStyle(
                  fontSize: 11.5,
                  color: Theme.of(context).accentColor,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
