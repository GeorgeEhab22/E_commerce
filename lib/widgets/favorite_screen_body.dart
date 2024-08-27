import 'package:e_commerce/constants.dart';
import 'package:e_commerce/cubits/fetch_all_products_cubit.dart/fetch_all_meals_cubit.dart';
import 'package:e_commerce/widgets/custom_favorite_screen_header.dart';
import 'package:e_commerce/widgets/favorites_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteScreenBody extends StatelessWidget {
  const FavoriteScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      right: false,
      left: false,
      bottom: false,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
            child: CustomFavoriteScreenHeader(),
          ),
          BlocBuilder<FetchAllProductssCubit, FetchAllProductssCubitState>(
            builder: (context, state) {
              if (state is FetchAllProductsSuccess) {
                var product = state.productsList;
                return (product.isEmpty)
                    ? const SliverToBoxAdapter(
                        child: Center(
                          child: Text(
                            'No products saved yet',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                color: kN22),
                          ),
                        ),
                      )
                    : const SliverPadding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        sliver: FavoritesGridView(),
                      );
              } else if (state is FetchAllProductsFailure) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: Text(state.errorMessege),
                  ),
                );
              } else {
                return const SliverToBoxAdapter(child: SizedBox());
              }
            },
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 32,
            ),
          ),
        ],
      ),
    );
  }
}
