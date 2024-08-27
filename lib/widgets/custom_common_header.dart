import 'package:flutter/material.dart';

import '../constants.dart';

class CustomCommonHeader extends StatelessWidget {
  const CustomCommonHeader({super.key, required this.title, this.onTap});
  final String title;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(
            32,
          ),
          onTap: onTap,
          child: const Icon(
            Icons.arrow_back_ios,
            color: kN90,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width * 0.5),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              color: kN22,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
