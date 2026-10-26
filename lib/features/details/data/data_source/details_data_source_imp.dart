import 'package:ecommerce_app_huma_volve/core/network/api_client.dart';
import 'package:ecommerce_app_huma_volve/core/network/end_points.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/model/productModel.dart';

import 'details_remote_data_source.dart';

class DetailsDataSourceImp implements DetailsRemoteDataSource {
  final ApiClient _apiClient;

  DetailsDataSourceImp(this._apiClient);

  @override
  Future<ProductModel> getProductDetails(int productId) async {
    final response = await _apiClient.dio.get('${EndPoints.products}/$productId');
    return ProductModel.fromJson(response.data);
  }
}
