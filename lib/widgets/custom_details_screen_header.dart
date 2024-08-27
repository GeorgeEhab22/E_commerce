import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/widgets/custom_common_header.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CustomDetailsScreenHeader extends StatelessWidget {
  const CustomDetailsScreenHeader({
    super.key,
    required this.product,
  });
  final Products product;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCommonHeader(
          title: product.title ?? 'Nothing',
          onTap: () {
            Navigator.pop(context);
          },
        ),
        const Spacer(),
        InkWell(
          borderRadius: BorderRadius.circular(
            32,
          ),
          onTap: () {
            // Search request here
          },
          child: const Icon(
            Icons.search,
            size: 24,
            color: kN90,
          ),
        ),
      ],
    );
  }
}
