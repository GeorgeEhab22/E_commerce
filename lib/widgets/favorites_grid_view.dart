import 'package:e_commerce/models/products_model.dart';
import 'package:e_commerce/widgets/favorite_item.dart';
import 'package:flutter/material.dart';

import '../screens/details_screen.dart';

class FavoritesGridView extends StatelessWidget {
  const FavoritesGridView({super.key, required this.products});
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 2,
        childAspectRatio: 0.6,
      ),
      itemBuilder: (BuildContext context, int index) => InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                        product: products[index],
                      )));
        },
        child: FavoriteItem(
          productModel: products[index],
        ),
      ),
    );
  }
}
