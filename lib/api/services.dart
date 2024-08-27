import 'package:dio/dio.dart';
import 'package:e_commerce/api/products.dart';
class Services {
  Dio dio = Dio();
  Future<List<Products>> getData(
      {required String path}) async {
    Response response = await dio.get(path);
     Map<dynamic, dynamic> jsonData = response.data;
    List<dynamic> products = jsonData["products"];
    List<Products> productsList = [];
    for (var product in products) {
      productsList.add(Products.fromjson(product));
    }
    return productsList;
  }
  }