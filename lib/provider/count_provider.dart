import 'package:flutter/foundation.dart';

/*
change notifier as a a setstate work karta ha or iska context global hota ha
 */
class CounterProvider with ChangeNotifier{

  int _count = 0;
  int get count => _count;

  void setCount(){
    _count++;
    notifyListeners();
  }




}