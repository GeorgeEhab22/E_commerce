part of 'fetch_all_meals_cubit.dart';

sealed class FetchAllProductssCubitState {}

final class FetchAllProductsCubitInitial extends FetchAllProductssCubitState {}

class FetchAllProductsSuccess extends FetchAllProductssCubitState {
  final List<ProductModel> productsList;

  FetchAllProductsSuccess({required this.productsList});
}

class FetchAllProductsFailure extends FetchAllProductssCubitState {
  final String errorMessege;
  FetchAllProductsFailure(this.errorMessege);
}
