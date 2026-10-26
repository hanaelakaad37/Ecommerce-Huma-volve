
part of 'details_cubit.dart';

@immutable
sealed class DetailsState {}

final class DetailsInitial extends DetailsState {}

final class DetailsLoading extends DetailsState {}

final class DetailsSuccess extends DetailsState {
  final ProductEntity product;

  DetailsSuccess(this.product);
}

final class DetailsError extends DetailsState {
  final String errorMessage;

  DetailsError(this.errorMessage);
}
