import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/repository/home_repository.dart';

import '../../../../core/error_handling/error_handling.dart';
import '../entities/product_entity.dart';

class ProductUseCase {
  final HomeRepository _homeRepository;
  ProductUseCase(this._homeRepository);

  Future<Either<ErrorHandling,List<ProductEntity>>>call(int? categoryId){
    return _homeRepository.getProducts(categoryId);
  }

}