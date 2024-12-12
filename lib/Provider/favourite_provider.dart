import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';


class FavouriteProvider extends ChangeNotifier{
  final _favBox=Hive.box('fav_box');
  List<dynamic> _ids=[];
  List<dynamic> _favourite=[];

  List<dynamic> get ids => _ids;
  set ids(List<dynamic> newIds){
    _ids=newIds;
    notifyListeners();
  }

  List<dynamic> get favourite => _favourite;
  set favourite(List<dynamic> newFav){
    _favourite=newFav;
    notifyListeners();
  }

  getFavourite(){
    final favData=_favBox.keys.map((key) {
      final item=_favBox.get(key);

      return {
        'key': key,
        'id':item['id'],
      };
    },).toList();

    _favourite=favData.toList();
    _ids=_favourite.map((item) => item['id']).toList();
  }
  Future<void> deleteFav(int key) async{
    await _favBox.delete(key);
  }
  Future<void> createFav(Map<String,dynamic> addFav) async {
    await _favBox.add(addFav);
  }

  List<dynamic> _fav=[];

  List<dynamic> get fav => _fav;
  set fav(List<dynamic> newFav){
    _fav=newFav;
    notifyListeners();
  }

  getAllData(){
    final favData=_favBox.keys.map((key) {
      final item=_favBox.get(key);
      return {
        'key': key,
        'id':item['id'],
        'name':item['name'],
        'category':item['category'],
        'price':item['price'],
        'image':item['imageUrl'],
      };
    },).toList();
    _fav=favData.reversed.toList();
  }

  void clearAllFav() async {
    final favBox = Hive.box('Fav_box');
    await favBox.clear(); // Clear all stored data
    fav.clear();
    ids.clear();
    notifyListeners();
  }

}