/*
 * @Author: 一凨 
 * @Date: 2019-01-15 17:48:37 
 * @Last Modified by: 一凨
 * @Last Modified time: 2019-01-15 17:55:29
 */
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import './model/counter_model.dart';
import './result_page.dart';

class CountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scoped Model'),
        actions: <Widget>[
          IconButton(
            tooltip: 'to result',
            icon: Icon(Icons.home),
            onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>ResultPage()));
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('你都点击'),
            ScopedModelDescendant<CounterModel>(
              builder: (context, child, model) {
                return Text(
                  '${model.counter.toString()} 次了',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 33.0,
                  ),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: ScopedModelDescendant<CounterModel>(
        builder: (context,child,model){
          return FloatingActionButton(
            onPressed: model.increment,
            tooltip: 'add',
            child: Icon(Icons.add),
          );
        },
      ),
    );
  }
}
