import 'package:flutter/material.dart';
import '../util/data_utils.dart';
import '../model/pins_cell.dart';
import '../widgets/pins_list_cell.dart';

class PinsPage extends StatefulWidget {
  _PinsPageState createState() => _PinsPageState();
}

class _PinsPageState extends State<PinsPage> {
  List<PinsCell> _listData = new List();

  @override
  void initState() {
    getPinsList(false);
    super.initState();
  }

  void getPinsList(bool isLoadMOre) {
    DataUtils.getPinsListData().then((resultData) {
      setState(() {
        _listData = resultData;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_listData.length > 0) {
      return Container(
        color: Color(0xFFF4F5F5),
        child: PinsListCell(pinsCell: _listData[0]),
      );
    }else{
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
