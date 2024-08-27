import 'package:e_commerce/Navigations.dart';
import 'package:e_commerce/screens/HomePage.dart';
import 'package:e_commerce/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../helpers/get_snack_bar.dart';

class UserStreaming extends StatelessWidget {
  const UserStreaming({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
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
    );
  }
}
