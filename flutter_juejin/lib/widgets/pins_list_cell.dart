import 'package:flutter/material.dart';
import '../model/pins_cell.dart';

class PinsListCell extends StatefulWidget {

  final PinsCell pinsCell;

  PinsListCell({Key key,this.pinsCell}):super(key:key);

  _PinsListCellState createState() => _PinsListCellState();
}

class _PinsListCellState extends State<PinsListCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text(widget.pinsCell.content),
    );
  }
}