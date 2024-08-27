import 'package:e_commerce/api/apiConstants.dart';
import 'package:e_commerce/api/products.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import '../api/Services.dart';

part 'getProducts_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit() : super(GetProductsInitial());

  getProducts() async {
    emit(GetProductsLoading());
    try {
      List<Products> products = await Services().getData(
          path: ApiConstants.baseUrl+ApiConstants.endPoint );

      emit(GetProductsSuccess(productsList: products));
    } catch (e) {
      emit(GetProductsFailure(error: e.toString()));
    }
  }
}