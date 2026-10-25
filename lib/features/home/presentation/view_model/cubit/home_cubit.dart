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

  final int limit = 10;
  int offset = 0;
  bool loadingMore = false;
  bool hasMore = true;
  int? selectedCategory;

  List<ProductEntity> allProducts = [];

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
    selectedCategory = categoryId;
    offset = 0;
    hasMore = true;
    loadingMore = false;
    allProducts = [];

    emit(ProductLoading());

    final productsResult = await productUseCase.call(
      selectedCategory,
      limit: limit,
      offset: offset,
    );

    productsResult.fold(
      (failure) {
        emit(ProductError((failure as dynamic).errorMessage?.toString() ?? failure.toString()));
      },
      (products) {
        allProducts = List.from(products);
        offset = allProducts.length;
        if (products.length < limit) {
          hasMore = false;
        }
        emit(ProductSuccess(List.from(allProducts)));
      },
    );
  }

  Future<void> loadMoreProducts() async {
    if (loadingMore || !hasMore || state is! ProductSuccess) return;

    loadingMore = true;
    emit(ProductSuccess(List.from(allProducts)));

    final productsResult = await productUseCase.call(
      selectedCategory,
      limit: limit,
      offset: offset,
    );

    productsResult.fold(
      (failure) {
        loadingMore = false;
        emit(ProductSuccess(List.from(allProducts)));
      },
      (newProducts) {
        allProducts.addAll(newProducts);
        offset = allProducts.length;
        if (newProducts.length < limit) {
          hasMore = false;
        }
        loadingMore = false;
        emit(ProductSuccess(List.from(allProducts)));
      },
    );
  }
}
