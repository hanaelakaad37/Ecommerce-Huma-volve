import 'package:ecommerce_app_huma_volve/features/home/data/model/productModel.dart';

abstract class DetailsRemoteDataSource {
  Future<ProductModel> getProductDetails(int productId);
}
