import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:e_commerce/screens/onboarding.dart';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen(
        backgroundColor: const Color(0xff40BFFF),
        splashScreenBody: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.asset("assets/images/splash_screen.png"),
        ),
        duration: const Duration(seconds: 2),
        nextScreen: const Onboarding(),
      ),
    );
  }
}
