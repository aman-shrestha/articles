import 'dart:convert';
import 'dart:io';

import 'package:articles/app/modules/home/multi_data_model.dart';
import 'package:articles/app/modules/home/post_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;

class ApiServices {
  Future<MultiData?> getMultiDataWithOutModel() async {
    try {
      var response = await http.get(Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=b5642590ebf2421ead1f934afb0c4f4b"));
          if(response.statusCode == 200){
            MultiData model =MultiData.fromJson(json.decode(response.body));
            return model;
          }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
