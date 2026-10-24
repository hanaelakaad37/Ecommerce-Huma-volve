import '../model/categoryModel.dart';
import '../model/productModel.dart';

abstract class HomeRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
  Future<List<ProductModel>> getProducts(int? categoryId);
}