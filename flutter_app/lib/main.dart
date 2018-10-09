import 'package:flutter/material.dart';

import './pages/home_page.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter App Demo',
      home: new HomePage(),
    );
  }
}
