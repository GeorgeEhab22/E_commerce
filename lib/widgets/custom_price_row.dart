import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class CustomPriceRow extends StatelessWidget {
  const CustomPriceRow({super.key, this.fontSize = 20});
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          r'$299,43',
          style: TextStyle(
            color: kN40,
            fontSize: fontSize,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
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
        const Text(
          '4.5',
          style: TextStyle(
            color: kN22,
          ),
        ),
      ],
    );
  }
}
