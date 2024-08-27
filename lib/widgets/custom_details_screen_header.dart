import 'package:e_commerce/widgets/custom_common_header.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CustomDetailsScreenHeader extends StatelessWidget {
  const CustomDetailsScreenHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomCommonHeader(title: 'Nike Air Max 270 Rea'),
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
