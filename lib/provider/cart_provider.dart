import 'package:flutter/foundation.dart';


class CartProvider with ChangeNotifier{

  final List<String> _selectedItems = [];
  double _totalPrice = 0.0;


  List<String> get selectedItems => _selectedItems;
  double get totalPrice => _totalPrice;


  void addItem(String items, double price){

     _selectedItems.add(items);
     _totalPrice += price;
     notifyListeners();

  }

  void removeItem(String items, double price){

    _selectedItems.remove(items);
    _totalPrice -= price;
    notifyListeners();

  }









}