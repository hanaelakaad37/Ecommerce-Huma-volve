import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/error_handling/error_handling.dart';
import 'package:ecommerce_app_huma_volve/core/failure/failure.dart';
import 'package:ecommerce_app_huma_volve/features/details/data/data_source/details_remote_data_source.dart';
import 'package:ecommerce_app_huma_volve/features/details/domain/repository/details_repository.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entities/product_entity.dart';

class DetailsRepositoryImp implements DetailsRepository {
  final DetailsRemoteDataSource _remoteDataSource;

  DetailsRepositoryImp(this._remoteDataSource);

  @override
  Future<Either<Failure, ProductEntity>> getProductDetails(int productId) async {
    try {
      final product = await _remoteDataSource.getProductDetails(productId);
      return right(product);
    } catch (e) {
      return left(ErrorHandling.handle(e));
    }
  }
}
