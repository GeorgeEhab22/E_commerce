part of 'add_meal_cubit.dart';

sealed class AddProductState {}

final class AddProductInitial extends AddProductState {}

class AddProudctSuccess extends AddProductState {}

class AddProductFailure extends AddProductState {
  final String errorMessege;
  AddProductFailure(this.errorMessege);
}