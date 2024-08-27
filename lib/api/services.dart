import 'package:dio/dio.dart';
import 'package:e_commerce/models/products_model.dart';

class Services {
  Dio dio = Dio();
  Future<List<ProductModel>> getData({required String path}) async {
    Response response = await dio.get(path);
    Map<dynamic, dynamic> jsonData = response.data;
    List<dynamic> products = jsonData["products"];
    List<ProductModel> productsList = [];
    for (var product in products) {
      productsList.add(ProductModel.fromjson(product));
    }
    return productsList;
  }
}
