import 'package:e_commerce/cubits/add_product_cubit/add_product_cubit.dart';
import 'package:e_commerce/cubits/delete_product_cubit/delete_product_cubit.dart';
import 'package:e_commerce/cubits/fetch_all_products_cubit.dart/fetch_all_meals_cubit.dart';
import 'package:e_commerce/helpers/get_snack_bar.dart';
import 'package:e_commerce/models/products_model.dart';
import 'package:e_commerce/widgets/custom_price_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';

import '../constants.dart';

class DetailsScreenMiddleSection extends StatefulWidget {
  const DetailsScreenMiddleSection({super.key, required this.product});
  final ProductModel product;
  @override
  State<DetailsScreenMiddleSection> createState() =>
      _DetailsScreenMiddleSectionState();
}

class _DetailsScreenMiddleSectionState
    extends State<DetailsScreenMiddleSection> {
  @override
  Widget build(BuildContext context) {
    Box<ProductModel> box = Hive.box<ProductModel>(kProductsBox);
    ProductModel? product = box.get(widget.product.id);
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.sizeOf(context).width * 0.7,
              ),
              child: Text(
                widget.product.title ?? "Nothing",
                style: const TextStyle(
                  fontSize: 20,
                  color: kN22,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            InkWell(
              borderRadius: BorderRadius.circular(
                18,
              ),
              onTap: () async {
                // add here
                try {
                  if (product == null) {
                    await BlocProvider.of<AddProductCubit>(context)
                        .addProduct(productModle: widget.product);

                    if (mounted) {
                      setState(() {
                        getShowSnackBar(
                          context,
                          'Saved successfully',
                        );
                        BlocProvider.of<FetchAllProductssCubit>(context)
                            .fetchAllProduct();
                      });
                    }
                  } else {
                    await BlocProvider.of<DeleteProductCubit>(context)
                        .deleteProduct(productModel: widget.product);
                    if (mounted) {
                      setState(() {
                        getShowSnackBar(
                          context,
                          'Unsaved',
                        );
                        BlocProvider.of<FetchAllProductssCubit>(context)
                            .fetchAllProduct();
                      });
                    }
                  }
                } catch (e) {
                  getShowSnackBar(context, e.toString());
                }
              },
              child: Icon(
                (product == null)
                    ? FontAwesomeIcons.heart
                    : FontAwesomeIcons.solidHeart,
                color: kN90,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        CustomPriceRow(
          product: widget.product,
        ),
        const SizedBox(
          height: 24,
        )
      ],
    );
  }
}
