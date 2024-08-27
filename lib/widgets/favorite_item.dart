import 'package:e_commerce/widgets/custom_price_row.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: kEb,
          width: 4,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      kTestImage,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              constraints: const BoxConstraints(
                minHeight: 20,
                maxHeight: 40,
              ),
              child: const Text(
                'Nike Air Max 270 React ENG',
                style: TextStyle(
                  color: kN22,
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const CustomPriceRow(
              fontSize: 12,
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const Text(
                  r'$534.43',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: kN90,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  '24% Off',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffFB7181),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    // delete product in hive
                  },
                  child: const Icon(
                    Icons.delete,
                    color: kN90,
                    size: 24,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
