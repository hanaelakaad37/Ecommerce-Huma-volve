import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_huma_volve/features/home/service/home_service.dart';
import 'package:ecommerce_app_huma_volve/features/home/service/model/categoryModel.dart';
import 'package:ecommerce_app_huma_volve/features/home/service/model/productModel.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeService _homeService;
  HomeCubit(this._homeService) : super(HomeInitial());

  Future<void> getHomeData() async {
    emit(CategoryLoading());
    try {
      final categories = await _homeService.getCategories();
      emit(CategorySuccess(categories));

      if (categories.isNotEmpty) {
        getProducts(categories[0].id);
      }
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }

  Future<void> getProducts(int? categoryId) async {
    emit(ProductLoading());
    try {
      final products = await _homeService.getProducts(categoryId);
      emit(ProductSuccess(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
