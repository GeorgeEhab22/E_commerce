import 'package:flutter/material.dart';

import '../constants.dart';
import 'custom_details_screen_header.dart';

class DetailsSreenTopSection extends StatelessWidget {
  const DetailsSreenTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16,
            top: 26,
          ),
          child: CustomDetailsScreenHeader(),
        ),
        const SizedBox(
          height: 28,
        ),
        AspectRatio(
          aspectRatio: 375 / 238,
          child: Image.asset(
            kTestImage,
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
