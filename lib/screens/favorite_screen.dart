import 'package:e_commerce/cubits/fetch_all_products_cubit.dart/fetch_all_meals_cubit.dart';
import 'package:e_commerce/widgets/favorite_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FetchAllProductssCubit>(context).fetchAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FavoriteScreenBody(),
    );
  }
}
