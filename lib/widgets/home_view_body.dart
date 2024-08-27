import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/screens/details_screen.dart';
import 'package:e_commerce/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/getProducts_cubit.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      right: false,
      left: false,
      child: CustomScrollView(
        clipBehavior: Clip.none,
        slivers: [
          const SliverToBoxAdapter(
            child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: CustomTextField(text: 'Search')),
          ),
          BlocBuilder<GetProductsCubit, GetProductsState>(
            builder: (context, state) {
              if (state is GetProductsLoading) {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (state is GetProductsSuccess) {
                return SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  sliver: SliverGrid.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.55, // Adjusted for taller cards
                    ),
                    itemCount: state.productsList.length,
                    itemBuilder: (context, index) {
                      final product = state.productsList[index];
                      return InkWell(
                        borderRadius: BorderRadius.circular(15),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                        product: product,
                                      )));
                        },
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              15,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(
                              12.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    AspectRatio(
                                      aspectRatio:
                                          1.0, // Keeps the image ratio consistent
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: product.thumbnail != null
                                            ? CachedNetworkImage(
                                                imageUrl: product.thumbnail!)
                                            : Image.asset(kTestImage),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.title ?? "Nothing",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Icon(Icons.star,
                                              color: Colors.yellow[700],
                                              size: 16),
                                          const SizedBox(width: 5),
                                          Text(
                                            product.rating.toString(),
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        "\$${product.price.toString()}",
                                        style: const TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          const Text(
                                            "\$534.33", // Original price (static for example purposes)
                                            style: TextStyle(
                                              color: Colors.grey,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontSize: 12,
                                            ),
                                          ),
                                          // ignore: prefer_const_constructors
                                          Spacer(),
                                          const SizedBox(width: 5),
                                          Text(
                                            '${product.discountPercentage}%', // Discount (static for example purposes)
                                            style: const TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else if (state is GetProductsFailure) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      'Failed to load products: ${state.error}',
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                );
              } else {
                return const SliverToBoxAdapter(child: Center(child: Text("")));
              }
            },
          ),
        ],
      ),
    );
  }
}
