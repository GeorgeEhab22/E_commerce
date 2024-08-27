import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/widgets/details_screen_body.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.product});
  final Products product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailsScreenBody(
        product: product,
      ),
    );
  }
}
