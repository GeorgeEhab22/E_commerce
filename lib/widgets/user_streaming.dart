import 'package:e_commerce/Navigations.dart';
import 'package:e_commerce/cubits/delete_product_cubit/delete_product_cubit.dart';
import 'package:e_commerce/cubits/fetch_all_products_cubit.dart/fetch_all_meals_cubit.dart';
import 'package:e_commerce/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../helpers/get_snack_bar.dart';

class UserStreaming extends StatelessWidget {
  const UserStreaming({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DeleteProductCubit(),
        ),
        BlocProvider(
          create: (context) => FetchAllProductssCubit(),
        ),
      ],
      child: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('');
          }
          if (snapshot.hasError) {
            return getShowSnackBar(context, 'error occured');
          }
          if (snapshot.data == null) {
            return const SplashScreen();
          }
          if (snapshot.hasData) {
            return const Navigation();
          }
          return const SizedBox();
        },
      ),
    );
  }
}
