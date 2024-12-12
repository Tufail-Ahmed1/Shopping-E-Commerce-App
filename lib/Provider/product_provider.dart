import 'package:flutter/material.dart';
import 'package:practise_app/models/sneakers_model.dart';

class ProductProvider extends ChangeNotifier {

  int _activePage = 0;
  int get activePage => _activePage;

  set activePage(int newIndex){
    _activePage= newIndex;
    notifyListeners();
  }

  List<dynamic> _shoeSize=[];

  List<dynamic> get shoeSize=>_shoeSize;

  set shoeSize(List<dynamic> newShoe){
    _shoeSize=newShoe;
    notifyListeners();
  }

  void toggleCheck(int index) {
    for (int i = 1; i < _shoeSize.length; i++) {
      if (i == index) {
        _shoeSize[index]["has_stock"] =! _shoeSize[index]["has_stock"];
        notifyListeners();
      }
    }
  }

  int _counter=0;

  int get counter=>_counter;

  void increment(){
    _counter++;
    notifyListeners();
  }
  void decrement(){
    if(_counter>=1){
      _counter--;
      notifyListeners();
    }
  }

  List<SneakersModel> _cartItems = [];

  List<SneakersModel> get cartItems => _cartItems;

  void setCartItems(List<SneakersModel> items) {
    _cartItems = items;
    notifyListeners();
  }

  void removeItem(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }
}