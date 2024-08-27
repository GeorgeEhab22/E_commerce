import 'package:e_commerce/widgets/custom_favorite_screen_header.dart';
import 'package:e_commerce/widgets/favorites_grid_view.dart';
import 'package:flutter/material.dart';

class FavoriteScreenBody extends StatelessWidget {
  const FavoriteScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      right: false,
      left: false,
      bottom: false,
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: CustomFavoriteScreenHeader(),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            sliver: FavoritesGridView(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 32,
            ),
          ),
        ],
      ),
    );
  }
}
