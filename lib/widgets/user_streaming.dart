import 'package:e_commerce/Navigations.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../helpers/get_snack_bar.dart';

class UserStreaming extends StatelessWidget {
  const UserStreaming({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        try {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const ModalProgressHUD(
              inAsyncCall: true,
              child: Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              ),
            );
          }
          if (snapshot.hasError) {
            getShowSnackBar(context, 'error occured');
          }
          if (snapshot.data == null) {
            return const SplashScreen();
          }
          if (snapshot.hasData) {
            return const Navigation();
          }
        } catch (e) {
          //
        }
        return const SizedBox();
      },
    );
  }
}
