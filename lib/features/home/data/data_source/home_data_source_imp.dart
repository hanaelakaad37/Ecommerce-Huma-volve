import 'package:ecommerce_app_huma_volve/core/network/api_client.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/data_source/home_remote_data_source.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/model/categoryModel.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/model/productModel.dart';

import '../../../../core/network/end_points.dart';

class HomeDataSourceImp implements  HomeRemoteDataSource {
  final ApiClient _apiClient;
  HomeDataSourceImp(this._apiClient);
  @override
  Future<List<CategoryModel>> getCategories() async{
    final response = await _apiClient.dio.get(EndPoints.categories);
    final List jsonData = response.data;
    final List<CategoryModel> categories = jsonData
        .map((e) => CategoryModel.fromJson(e))
        .toList();
    return categories;
  }

  @override
  Future<List<ProductModel>> getProducts(
    int? categoryId, {
    required int limit,
    required int offset,
  }) async {
    final String product = "${EndPoints.categories}/$categoryId/${EndPoints.products}";

    final response = await _apiClient.dio.get(
      product,
      queryParameters: {
        "limit": limit,
        "offset": offset,
      },
    );
    final List jsonData = response.data;
    final List<ProductModel> products = jsonData
        .map((e) => ProductModel.fromJson(e))
        .toList();
    return products;
  }

}