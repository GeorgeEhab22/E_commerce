part of 'delete_product_cubit.dart';

sealed class DeleteProductCubitState {}

final class DeleteProductCubitInitial extends DeleteProductCubitState {}

final class DeleteProductSuccess extends DeleteProductCubitState {}

final class DeleteProductFailure extends DeleteProductCubitState {
  final String errorMsg;

  DeleteProductFailure(this.errorMsg);
}
