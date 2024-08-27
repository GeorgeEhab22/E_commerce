// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

import '../../models/products_model.dart';
part 'add_product_cubit_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit() : super(AddProductInitial());
  addMeal({required ProductModel productModle}) async {
    try {
      mealBox = Hive.box<MealModel>(kMealBox);
      String id = mealModel.idMeal!;
      await mealBox.put(id, mealModel);
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
