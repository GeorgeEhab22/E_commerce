import 'package:e_commerce/widgets/custom_price_row.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class DetailsScreenMiddleSection extends StatefulWidget {
  const DetailsScreenMiddleSection({super.key});

  @override
  State<DetailsScreenMiddleSection> createState() =>
      _DetailsScreenMiddleSectionState();
}

class _DetailsScreenMiddleSectionState
    extends State<DetailsScreenMiddleSection> {
  bool flag = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.sizeOf(context).width * 0.7,
              ),
              child: const Text(
                'Nike Air Zoom Pegasus 36 Miami',
                style: TextStyle(
                  fontSize: 20,
                  color: kN22,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                flag = !flag;
                setState(() {});
              },
              child: Icon(
                (!flag) ? FontAwesomeIcons.heart : FontAwesomeIcons.solidHeart,
                color: kN90,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        const CustomPriceRow(),
        const SizedBox(
          height: 24,
        )
      ],
    );
  }
}
