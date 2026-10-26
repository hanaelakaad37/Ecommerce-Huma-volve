import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/failure/failure.dart';
import 'package:ecommerce_app_huma_volve/features/details/domain/repository/details_repository.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entities/product_entity.dart';

class GetProductDetailsUseCase {
  final DetailsRepository _repository;

  GetProductDetailsUseCase(this._repository);

  Future<Either<Failure, ProductEntity>> call(int productId) {
    return _repository.getProductDetails(productId);
  }
}
