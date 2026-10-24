import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/error_handling/error_handling.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entities/category_entity.dart';

import '../entities/product_entity.dart';

abstract class HomeRepository {
  Future<Either<ErrorHandling,List<CategoryEntity>>> getCategories();
  Future<Either<ErrorHandling,List<ProductEntity>>>getProducts(int? categoryId) ;

}