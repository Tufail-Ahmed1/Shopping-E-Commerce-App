import 'dart:convert';
import 'package:http/http.dart' as http;
//import 'package:flutter/services.dart' as the_bundle;
import 'package:practise_app/models/sneakers_model.dart';

class Helper {

  Future<List<SneakersModel>> getSneakers() async {
    const url = 'https://67455a04512ddbd807f79e81.mockapi.io/tufail';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => SneakersModel.fromJson(json)).toList();
    } else {
      throw Exception('Data fetch failed');
    }
  }
  Future<List<SneakersModel>> getFemale() async {
    const url = 'https://67455a04512ddbd807f79e81.mockapi.io/female';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => SneakersModel.fromJson(json)).toList();
    } else {
      throw Exception('Data fetch failed');
    }
  }
}


// Future<NikeShoesModel> getMaleShoe() async {
//   try {
//     final data = await the_bundle.rootBundle.loadString('assets/json/nike_shoe.json');
//     print('Asset loaded successfully: $data');
//     final jsonData = jsonDecode(data);
//     return NikeShoesModel.fromJson(jsonData);
//   } catch (e) {
//     print('Error loading asset: $e');
//     rethrow;
//   }
//
// }