import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/failure/failure.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entities/product_entity.dart';

abstract class DetailsRepository {
  Future<Either<Failure, ProductEntity>> getProductDetails(int productId);
}
