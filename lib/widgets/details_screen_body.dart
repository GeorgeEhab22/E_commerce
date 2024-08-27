import 'package:e_commerce/widgets/details_screen_bottom_section.dart';
import 'package:e_commerce/widgets/details_screen_middle_dection.dart';
import 'package:e_commerce/widgets/details_sreen_top_section.dart';
import 'package:flutter/material.dart';

class DetailsScreenBody extends StatelessWidget {
  const DetailsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      right: false,
      left: false,
      child: Column(
        children: [
          DetailsSreenTopSection(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: DetailsScreenMiddleSection(),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: DetailsScreenBottomSection(),
            ),
          ),
        ],
      ),
    );
  }
}
