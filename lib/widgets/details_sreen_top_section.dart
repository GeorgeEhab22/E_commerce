import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/models/products_model.dart';
import 'package:flutter/material.dart';

import 'custom_details_screen_header.dart';

class DetailsSreenTopSection extends StatelessWidget {
  const DetailsSreenTopSection({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16,
            top: 26,
          ),
          child: CustomDetailsScreenHeader(
            product: product,
          ),
        ),
        const SizedBox(
          height: 28,
        ),
        AspectRatio(
          aspectRatio: 375 / 238,
          child: CachedNetworkImage(
            imageUrl: product.thumbnail!,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
