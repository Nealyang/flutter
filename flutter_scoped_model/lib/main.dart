/*
 * @Author: 一凨 
 * @Date: 2019-01-15 17:48:34 
 * @Last Modified by:   一凨 
 * @Last Modified time: 2019-01-15 17:48:34 
 */
import 'package:flutter/material.dart';
import './model/counter_model.dart';
import 'package:scoped_model/scoped_model.dart';
import './count_page.dart';

void main() {
  runApp(MyApp(
    model: CounterModel(),
  ));
}

class MyApp extends StatelessWidget {

  final CounterModel model;

  const MyApp({Key key,@required this.model}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: model,
      child: MaterialApp(
        title: 'Scoped Model Demo',
        home:CountPage(),
      ),
    );
  }
}