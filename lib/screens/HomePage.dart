import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/getProducts_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    bool isTabletOrDesktop = width > 600;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: Center(
          child: SizedBox(
            width: isTabletOrDesktop ? width * 0.5 : width * 0.75,
            height: height * 0.05,
            child: TextField(
              autofocus: false,
              style: const TextStyle(color: Colors.grey),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search',
                hintStyle: const TextStyle(color: Colors.grey, height: 0.8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ),
      ),
      body: BlocBuilder<GetProductsCubit, GetProductsState>(
        builder: (context, state) {
          if (state is GetProductsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetProductsSuccess) {
            return Padding(
              padding: EdgeInsets.all(width * 0.03),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isTabletOrDesktop ? 4 : 2,
                  crossAxisSpacing: width * 0.03,
                  mainAxisSpacing: height * 0.03,
                  childAspectRatio: isTabletOrDesktop
                      ? 0.6
                      : 0.55, // Adjusted for taller cards
                ),
                itemCount: state.productsList.length,
                itemBuilder: (context, index) {
                  final product = state.productsList[index];
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(isTabletOrDesktop ? 12.0 : 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AspectRatio(
                            aspectRatio:
                                1.0, // Keeps the image ratio consistent
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                product.thumbnail,
                                fit: BoxFit
                                    .cover, // Ensures the image covers the area without distortion
                                width: double.infinity,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.title,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: isTabletOrDesktop ? 16 : 14,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    Icon(Icons.star,
                                        color: Colors.yellow[700],
                                        size: isTabletOrDesktop ? 18 : 16),
                                    const SizedBox(width: 5),
                                    Text(
                                      product.rating.toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: isTabletOrDesktop ? 16 : 14,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "\$${product.price.toString()}",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: isTabletOrDesktop ? 18 : 16,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(
                                      "\$534.33", // Original price (static for example purposes)
                                      style: TextStyle(
                                        color: Colors.grey,
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: isTabletOrDesktop ? 14 : 12,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      "24% Off", // Discount (static for example purposes)
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: isTabletOrDesktop ? 16 : 14,
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
                  );
                },
              ),
            );
          } else if (state is GetProductsFailure) {
            return Center(
              child: Text(
                'Failed to load products: ${state.error}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else {
            return const Center(child: Text("No data available"));
          }
        },
      ),
    );
  }
}
