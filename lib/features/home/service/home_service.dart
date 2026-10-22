import 'package:ecommerce_app_huma_volve/core/network/api_client.dart';
import 'package:ecommerce_app_huma_volve/core/network/end_points.dart';

import 'model/categoryModel.dart';
import 'model/productModel.dart';

class HomeService {
  final ApiClient _apiClient;
  HomeService(this._apiClient);

  Future<List<CategoryModel>> getCategories() async {
    final response = await _apiClient.dio.get(EndPoints.categories);
    final List jsonData = response.data;
    final List<CategoryModel> categories = jsonData
        .map((e) => CategoryModel.fromJson(e))
        .toList();
    return categories;
  }

  Future<List<ProductModel>> getProducts(int? categoryId) async {
    final response = await _apiClient.dio.get(
      "${EndPoints.categories}/$categoryId/${EndPoints.products}",
    );
    final List jsonData = response.data;
    final List<ProductModel> products = jsonData
        .map((e) => ProductModel.fromJson(e))
        .toList();
    return products;
  }
}
