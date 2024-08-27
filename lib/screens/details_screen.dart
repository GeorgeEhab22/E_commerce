import 'package:e_commerce/cubits/add_product_cubit/add_product_cubit.dart';
import 'package:e_commerce/models/products_model.dart';
import 'package:e_commerce/widgets/details_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductCubit(),
      child: Scaffold(
        body: DetailsScreenBody(
          product: product,
        ),
      ),
    );
  }
}
