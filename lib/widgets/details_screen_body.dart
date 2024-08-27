import 'package:e_commerce/models/products_model.dart';
import 'package:e_commerce/widgets/details_screen_bottom_section.dart';
import 'package:e_commerce/widgets/details_screen_middle_dection.dart';
import 'package:e_commerce/widgets/details_sreen_top_section.dart';
import 'package:flutter/material.dart';

class DetailsScreenBody extends StatelessWidget {
  const DetailsScreenBody({
    super.key,
    required this.product,
  });
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      right: false,
      left: false,
      child: Column(
        children: [
          DetailsSreenTopSection(
            product: product,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: DetailsScreenMiddleSection(
              product: product,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: DetailsScreenBottomSection(
                product: product,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
