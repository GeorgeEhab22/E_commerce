// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:e_commerce/models/products.dart';
part 'add_meal_cubit_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit() : super(AddProductInitial());
  addMeal({required Products mealModel}) async {
    try {
      // mealBox = Hive.box<MealModel>(kMealBox);
      // String id = mealModel.idMeal!;
      // await mealBox.put(id, mealModel);
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
