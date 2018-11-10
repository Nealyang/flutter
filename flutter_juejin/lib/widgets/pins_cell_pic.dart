import 'package:flutter/material.dart';

class PinsCellPic extends StatelessWidget {
  final List<String> pics;
  List<Widget> _wrapChildren = List();
  double _picHeight = 230.0;

  PinsCellPic({Key key, this.pics}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (pics.length > 3) {
      _picHeight = 190.0;
    }
    for (int i = 0; i < pics.length; i += 3) {
      List<Widget> _tempRow = List();
      _tempRow.add(
        Expanded(
          child: Image.network(
            pics[i],
            fit: BoxFit.cover,
            height: _picHeight,
          ),
          flex: 1,
        ),
      );
      if (i + 1 < pics.length) {
        _tempRow.add(
          SizedBox(
            width: 10.0,
          ),
        );
        _tempRow.add(
          Expanded(
            child: Image.network(
              pics[i + 1],
              fit: BoxFit.cover,
              height: _picHeight,
            ),
            flex: 1,
          ),
        );
      }
      if (i + 2 < pics.length) {
        _tempRow.add(
          SizedBox(
            width: 10.0,
          ),
        );
        _tempRow.add(
          Expanded(
            child: Image.network(
              pics[i + 2],
              fit: BoxFit.cover,
              height: _picHeight,
            ),
            flex: 1,
          ),
        );
      }
      _wrapChildren.add(Container(
        child: Row(
          children: _tempRow,
        ),
        margin: const EdgeInsets.only(bottom: 10.0),
      ));
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Wrap(
        children: _wrapChildren,
      ),
    );
  }
}
