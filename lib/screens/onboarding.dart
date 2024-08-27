import 'package:e_commerce/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 80),
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              decoration: myPageDecoration(),
              title: "MAKE ORDER",
              body: 'comment',
              image: Image.asset(
                "assets/images/Onboard1.png",
              ),
            ),
            PageViewModel(
              decoration: myPageDecoration(),
              title: "CHOOSE PAYMENT",
              body: 'comment',
              image: Image.asset(
                'assets/images/Onboard2.png',
              ),
            ),
            PageViewModel(
                decoration: myPageDecoration(),
                title: "FAST DELIVERY",
                body: 'comment',
                image: Image.asset(
                  "assets/images/Onboard3.png",
                )),
          ],
          showSkipButton: true,
          skip: const Text(
            "Skip",
            style: TextStyle(
              color: Color(0xff40BFFF),
            ),
          ),
          done: const Text(
            'done',
            style: TextStyle(
              color: Color(0xff40BFFF),
            ),
          ),
          onDone: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return const LoginPage();
              }),
            );
          },
          next: const Icon(
            Icons.arrow_forward,
            color: Color(0xff40BFFF),
          ),
          dotsDecorator: const DotsDecorator(activeSize: Size(20, 11)),
        ),
      ),
    );
  }
}

PageDecoration myPageDecoration() {
  return const PageDecoration(
    titleTextStyle: TextStyle(
      color: Color(0xff40BFFF),
      fontWeight: FontWeight.bold,
      fontSize: 25,
    ),
    imageFlex: 3,
  );
}
