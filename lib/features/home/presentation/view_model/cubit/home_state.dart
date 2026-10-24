part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class CategoryLoading extends HomeState {}

final class CategorySuccess extends HomeState {
  final List<CategoryEntity> categories;
  CategorySuccess(this.categories);
}

final class CategoryError extends HomeState {
  final String errorMessage;
  CategoryError(this.errorMessage);
}

final class ProductLoading extends HomeState {}

final class ProductSuccess extends HomeState {
  final List<ProductEntity> products;
  ProductSuccess(this.products);
}

final class ProductError extends HomeState {
  final String errorMessage;
  ProductError(this.errorMessage);
}
