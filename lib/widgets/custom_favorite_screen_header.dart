import 'package:e_commerce/widgets/custom_common_header.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CustomFavoriteScreenHeader extends StatelessWidget {
  const CustomFavoriteScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 28,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: CustomCommonHeader(
            title: 'Favorite Products',
            flag: true,
          ),
        ),
        SizedBox(
          height: 28,
        ),
        Divider(
          thickness: 3,
          color: kEb,
        ),
        SizedBox(
          height: 16,
        )
      ],
    );
  }
}
