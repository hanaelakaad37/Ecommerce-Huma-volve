import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/error_handling/error_handling.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/data_source/home_remote_data_source.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entities/category_entity.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entities/product_entity.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/repository/home_repository.dart';

class RepositoryImp implements HomeRepository {
  final HomeRemoteDataSource _homeRemoteDataSource;
  RepositoryImp(this._homeRemoteDataSource);
  @override
  Future<Either<ErrorHandling, List<CategoryEntity>>> getCategories() async {
    try {
      final categories = await _homeRemoteDataSource.getCategories();
      return right(categories as List<CategoryEntity>);
    } catch (e) {
      return left(ErrorHandling.handle(e) as ErrorHandling);
    }
  }

  @override
  Future<Either<ErrorHandling, List<ProductEntity>>> getProducts(
      int? categoryId, {
        required int limit,
        required int offset,
      }
  ) async {
    try {
      final products = await _homeRemoteDataSource.getProducts(categoryId, limit: limit, offset: offset);
      return right(products as List<ProductEntity>);
    } catch (e) {
      return left(ErrorHandling.handle(e) as ErrorHandling);
    }
  }
}
