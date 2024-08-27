import 'package:bloc/bloc.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/models/products_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
part 'fetch_all_meals_cubit_state.dart';

class FetchAllProductssCubit extends Cubit<FetchAllProductssCubitState> {
  FetchAllProductssCubit() : super(FetchAllProductsCubitInitial());
  List<ProductModel> products = [];
  late Box<ProductModel> myBox;
  void fetchAllProduct() {
    try {
      var productsBox = Hive.box<ProductModel>(kProductsBox);
      var storedProducts = productsBox.values.toList();
      emit(
        FetchAllProductsSuccess(productsList: storedProducts),
      );
    } catch (e) {
      emit(
        FetchAllProductsFailure(e.toString()),
      );
    }
  }
}
