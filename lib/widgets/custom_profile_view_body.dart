import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';

class CustomProfileViewBody extends StatelessWidget {
  const CustomProfileViewBody({
    super.key,
    required this.displayName,
    required this.email,
  });

  final String displayName;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 52, // Responsive height
        ),
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                left: 36,
              ), // Responsive padding
              child: CircleAvatar(
                radius: 42, // Responsive radius
                backgroundImage: AssetImage("assets/images/Messi.jpg"),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  displayName,
                  style: const TextStyle(
                      fontSize: 20, // Responsive font size
                      color: kN22,
                      fontFamily: 'Poppins'),
                ),
                Text(
                  email,
                  style: const TextStyle(
                    fontSize: 18, // Responsive font size
                    color: kN90,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
