/*
 * @Author: 一凨 
 * @Date: 2019-01-15 17:48:41 
 * @Last Modified by:   一凨 
 * @Last Modified time: 2019-01-15 17:48:41 
 */
import 'package:scoped_model/scoped_model.dart';

class CounterModel extends Model{

  int _counter = 0;

  int get counter => _counter;

  void increment(){

    _counter++;

    // 通知所有的 listener
    notifyListeners();
  }
}