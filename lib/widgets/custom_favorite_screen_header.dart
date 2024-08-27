import 'package:e_commerce/widgets/custom_common_header.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CustomFavoriteScreenHeader extends StatelessWidget {
  const CustomFavoriteScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 28,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: CustomCommonHeader(
            title: 'Favorite Products',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        const SizedBox(
          height: 28,
        ),
        const Divider(
          thickness: 3,
          color: kEb,
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }
}
