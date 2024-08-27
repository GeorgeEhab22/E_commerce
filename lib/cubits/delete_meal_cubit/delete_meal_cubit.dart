import 'package:bloc/bloc.dart';
import 'package:e_commerce/models/products.dart';

part 'delete_meal_cubit_state.dart';

class DeleteProductCubit extends Cubit<DeleteProductCubitState> {
  DeleteProductCubit() : super(DeleteProductCubitInitial());

  Future<void> deleteMeal({
    required Products mealModel,
  }) async {
    try {
      // await mealBox.delete(mealModel.idMeal);
      emit(DeleteProductSuccess());
    } catch (e) {
      emit(
        DeleteProductFailure(
          e.toString(),
        ),
      );
    }
  }
}
