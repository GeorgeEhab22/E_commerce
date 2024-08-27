part of 'getProducts_cubit.dart';

@immutable
sealed class GetProductsState {}

final class GetProductsInitial extends GetProductsState {}

final class GetProductsLoading extends GetProductsState {}

final class GetProductsFailure extends GetProductsState {
  final String error;

  GetProductsFailure({required this.error});
}

final class GetProductsSuccess extends GetProductsState {
  final List<Products> productsList;

  GetProductsSuccess({required this.productsList});
}