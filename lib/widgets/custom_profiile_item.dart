import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';

class CustomProfileItem extends StatelessWidget {
  const CustomProfileItem({
    super.key,
    required this.leading,
    required this.titel,
    required this.trailingText,
  });
  final Widget leading;
  final String titel;
  final String trailingText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 15,
      ),
      child: ListTile(
        leading: leading,
        title: Text(
          titel,
          style: const TextStyle(
            fontSize: 22,
            color: kN22,
            fontFamily: 'Poppins',
          ),
        ),
        trailing: Row(
          children: [
            Text(
              trailingText,
              style: const TextStyle(
                fontSize: 12,
                fontFamily: 'Poppins',
                color: kN90,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            const Icon(
              Icons.arrow_back_ios_new,
              color: kN90,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
