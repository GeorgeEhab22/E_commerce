import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/cubits/delete_product_cubit/delete_product_cubit.dart';
import 'package:e_commerce/cubits/fetch_all_products_cubit.dart/fetch_all_meals_cubit.dart';
import 'package:e_commerce/helpers/get_snack_bar.dart';
import 'package:e_commerce/models/products_model.dart';
import 'package:e_commerce/widgets/custom_price_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../constants.dart';

class FavoriteItem extends StatefulWidget {
  const FavoriteItem({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  State<FavoriteItem> createState() => _FavoriteItemState();
}

class _FavoriteItemState extends State<FavoriteItem> {
  @override
  Widget build(BuildContext context) {
    var productsBox = Hive.box<ProductModel>(kProductsBox);

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
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: widget.productModel.thumbnail != null
                          ? CachedNetworkImageProvider(
                              widget.productModel.thumbnail!)
                          : const AssetImage(kTestImage)),
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
              child: Text(
                widget.productModel.title ?? "Nothing",
                style: const TextStyle(
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
            CustomPriceRow(
              fontSize: 12, product: widget.productModel,
              // product: null,
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Row(
                  children: [
                    const Text(
                      r'$',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: kN90,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    Text(
                      widget.productModel.price ?? "Nothing",
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: kN90,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  widget.productModel.discountPercentage.toString(),
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffFB7181),
                  ),
                ),
                const Spacer(),
                InkWell(
                  borderRadius: BorderRadius.circular(
                    18,
                  ),
                  onTap: () async {
                    await BlocProvider.of<DeleteProductCubit>(context)
                        .deleteProduct(
                      productModel: widget.productModel,
                    );
                    if (mounted) {
                      setState(() {
                        getShowSnackBar(context, 'Unsaved');
                        BlocProvider.of<FetchAllProductssCubit>(context)
                            .fetchAllProduct();
                      });
                    }
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
