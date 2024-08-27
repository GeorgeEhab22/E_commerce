import 'package:e_commerce/widgets/favorite_item.dart';
import 'package:flutter/material.dart';

class FavoritesGridView extends StatelessWidget {
  const FavoritesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 12,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 2,
        childAspectRatio: 0.62,
      ),
      itemBuilder: (BuildContext context, int index) => const FavoriteItem(),
    );
  }
}
