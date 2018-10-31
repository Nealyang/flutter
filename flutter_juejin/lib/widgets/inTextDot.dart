import 'package:flutter/material.dart';

class InTextDot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 3.0,
      height: 3.0,
      margin: const EdgeInsets.symmetric(horizontal: 6.0),
      decoration: BoxDecoration(
          color: Color(0xFFB2BAC2),
          borderRadius: BorderRadius.all(Radius.circular(3.0))),
    );
  }
}
