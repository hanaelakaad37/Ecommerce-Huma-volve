
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app_huma_volve/features/details/domain/use_case/get_product_details_use_case.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entities/product_entity.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  final GetProductDetailsUseCase getProductDetailsUseCase;

  DetailsCubit({
    required this.getProductDetailsUseCase,
  }) : super(DetailsInitial());

  Future<void> getProductDetails(int productId) async {
    emit(DetailsLoading());

    try {
      final result = await getProductDetailsUseCase.call(productId);

      result.fold(
            (failure) {
          emit(DetailsError(failure.errorMessage));
        },
            (product) {
          emit(DetailsSuccess(product));
        },
      );
    } catch (e) {
      emit(DetailsError('Something went wrong. Please try again.'));
    }
  }
}
