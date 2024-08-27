import 'package:bloc/bloc.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/models/products_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
part 'fetch_all_meals_cubit_state.dart';

class FetchAllProductssCubit extends Cubit<FetchAllProductssCubitState> {
  FetchAllProductssCubit() : super(FetchAllProductsCubitInitial());
  List<ProductModel> meals = [];
  late Box<ProductModel> myBox;
  fetchAllProduct() {
    try {
      var mealBox = Hive.box<ProductModel>(kProductsBox);
      var storedMeals = mealBox.values.toList();
      meals = storedMeals;
      emit(
        FetchAllProductsSuccess(productsList: storedMeals),
      );
    } catch (e) {
      emit(
        FetchAllProductsFailure(e.toString()),
      );
    }
  }
}
