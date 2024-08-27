import 'package:e_commerce/constants.dart';
import 'package:e_commerce/screens/favorite_screen.dart';
import 'package:flutter/material.dart';

class DetailsScreenBottomSection extends StatelessWidget {
  const DetailsScreenBottomSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Specification',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: kN22,
            fontFamily: 'Poppins',
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(
          'The Nike Air Max 270 React ENG combines a full-length React foam midsole with a 270 Max Air unit for unrivaled comfort and a striking visual experience.',
          style: TextStyle(
            color: kN90,
            fontFamily: 'Poppins',
            fontSize: 12,
          ),
        ),
        const Spacer(),
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                5,
              )),
              backgroundColor: kN40,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavoriteScreen(),
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Add To Cart',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }
}
