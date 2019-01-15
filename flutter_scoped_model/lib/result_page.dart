/*
 * @Author: 一凨 
 * @Date: 2019-01-15 17:48:30 
 * @Last Modified by: 一凨
 * @Last Modified time: 2019-01-15 19:06:18
 */
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import './model/counter_model.dart';

class ResultPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('结果页'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('这个结果是共享的哦'),
            ScopedModelDescendant<CounterModel>(
              builder: (context,chid,model){
                return Text('结果是：${model.counter}',style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.bold),);
              },
            )
          ],
        ),
      ),
    );
  }
}
