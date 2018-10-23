import 'package:flutter/material.dart';

import './product_manager.dart';

void main() {
  // debugPaintSizeEnabled = true;
  // debugPaintBaselinesEnabled = true;
  // debugPaintPointersEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowMaterialGrid: true,
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepPurple),
      home: Scaffold(
        appBar: AppBar(
          title: Text('EasyList'),
        ),
        body: ProductManager(startingProduct: 'Food Tester'),
      ),
    );
  }
}
