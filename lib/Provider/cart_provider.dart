import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CartProvider extends ChangeNotifier{

  final _cartBox=Hive.box('cart_box');
  List<dynamic> _cart=[];
  List<dynamic> _ids=[];

  List<dynamic> get ids => _ids;
  set ids(List<dynamic> newIds){
    _ids=newIds;
    notifyListeners();
  }

  List<dynamic> get cart=>_cart;
  set carts(List<dynamic> cartItem){

    _cart=cartItem;
    notifyListeners();
  }
  getCart(){
    final cartData=_cartBox.keys.map((key) {
      final item=_cartBox.get(key);

      return {
        'key': key,
        'id':item['id'],
      };
    },).toList();

    _cart=cartData.toList();
  }


  getCartData(){
    final cartData=_cartBox.keys.map((key) {
      final item=_cartBox.get(key);
      return {
        'key': key,
        'id': item['id'],
        'name':item['name'],
        'category':item['category'],
        'price':item['price'],
        'sizes':item['sizes'],
        'image': item['imageUrl'],
      };
    },).toList();
    _cart=cartData.reversed.toList();


  }
  Future<void> deleteCart(int key) async{
    await _cartBox.delete(key);
  }

  Future<void> createCart(Map<String,dynamic> addCart) async{
    await _cartBox.add(addCart);
  }
  double calculateTotal() {
    double total = 0.0;
    for (var item in cart) {
      total += (item['price'] ?? 0); // Sum up the prices
    }
    return total;
  }

  void clearAllCart() async {
    final favBox = Hive.box('cart_box');
    await favBox.clear(); // Clear all stored data
    cart.clear();
    ids.clear();
    notifyListeners();
  }
}
