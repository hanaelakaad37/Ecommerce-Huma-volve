import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/repository/home_repository.dart';

import '../../../../core/error_handling/error_handling.dart';
import '../entities/category_entity.dart';

class CategoryUseCase {
  final HomeRepository _homeRepository;
  CategoryUseCase(this._homeRepository);

  Future<Either<ErrorHandling,List<CategoryEntity>>> call(){
    return _homeRepository.getCategories();
  }

}