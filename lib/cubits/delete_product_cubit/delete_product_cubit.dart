import 'package:bloc/bloc.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/models/products_model.dart';
import 'package:hive/hive.dart';

part 'delete_product_cubit_state.dart';

class DeleteProductCubit extends Cubit<DeleteProductCubitState> {
  DeleteProductCubit() : super(DeleteProductCubitInitial());

  Future<void> deleteProduct({
    required ProductModel productModel,
  }) async {
    try {
      var productsBox = Hive.box<ProductModel>(kProductsBox);

      await productsBox.delete(productModel.id);
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
