import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import '../models/products.dart';

class CustomPriceRow extends StatelessWidget {
  const CustomPriceRow({super.key, this.fontSize = 20, required this.product});
  final double fontSize;
  final Products? product;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Text(
              r'$',
              style: TextStyle(
                color: kN40,
                fontSize: fontSize,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              product!.price.toString(),
              style: TextStyle(
                color: kN40,
                fontSize: fontSize,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Spacer(),
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Colors.yellow,
          size: 18,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          product!.rating.toString(),
          style: const TextStyle(
            color: kN22,
          ),
        ),
      ],
    );
  }
}
