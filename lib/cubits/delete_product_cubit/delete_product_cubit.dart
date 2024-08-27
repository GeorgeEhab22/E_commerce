import 'package:bloc/bloc.dart';
import 'package:e_commerce/models/products_model.dart';

part 'delete_product_cubit_state.dart';

class DeleteProductCubit extends Cubit<DeleteProductCubitState> {
  DeleteProductCubit() : super(DeleteProductCubitInitial());

  Future<void> deleteMeal({
    required ProductModel mealModel,
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
