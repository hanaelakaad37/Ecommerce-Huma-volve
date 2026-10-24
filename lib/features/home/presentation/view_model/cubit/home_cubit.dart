import 'package:ecommerce_app_huma_volve/features/home/domain/entities/category_entity.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entities/product_entity.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/use_case/category_use_case.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/use_case/product_use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final CategoryUseCase categoryUseCase;
  final ProductUseCase productUseCase;

  HomeCubit({
    required this.categoryUseCase,
    required this.productUseCase,
  }) : super(HomeInitial());

  Future<void> getHomeData() async {
    emit(CategoryLoading());

    final categoriesResult = await categoryUseCase.call();
    categoriesResult.fold(
      (failure) {
        emit(CategoryError((failure as dynamic).errorMessage?.toString() ?? failure.toString()));
      },
      (categories) {
        emit(CategorySuccess(categories));
        if (categories.isNotEmpty) {
          getProducts(categories[0].id);
        } else {
          emit(ProductSuccess(const []));
        }
      },
    );
  }

  Future<void> getProducts(int? categoryId) async {
    emit(ProductLoading());

    final productsResult = await productUseCase.call(categoryId);
    productsResult.fold(
      (failure) {
        emit(ProductError((failure as dynamic).errorMessage?.toString() ?? failure.toString()));
      },
      (products) {
        emit(ProductSuccess(products));
      },
    );
  }
}
