// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:e_commerce/constants.dart';
import 'package:hive_flutter/adapters.dart';

import '../../models/products_model.dart';
part 'add_product_cubit_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit() : super(AddProductInitial());
  Future<void> addProduct({required ProductModel productModle}) async {
    try {
      var productsBox = Hive.box<ProductModel>(kProductsBox);
      String id = productModle.id!;
      await productsBox.put(id, productModle);
      emit(AddProudctSuccess());
    } catch (e) {
      emit(
        AddProductFailure(
          e.toString(),
        ),
      );
    }
  }
}
