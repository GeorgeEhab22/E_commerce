import 'package:e_commerce/screens/signup.dart';
import 'package:e_commerce/widgets/log_in_middle_section.dart';
import 'package:flutter/material.dart';

class LogInBody extends StatelessWidget {
  const LogInBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 100,
        ),
        child: Column(
          children: [
            Image.asset('assets/Logo/login.png'),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Welcome to online Shop',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  letterSpacing: .5,
                  color: Color(0xff223263),
                  fontStyle: FontStyle.normal),
            ),
            const Text(
              'sign in to continue',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  letterSpacing: .5,
                  color: Color(0xff9098B1),
                  fontStyle: FontStyle.normal),
            ),
            const SizedBox(
              height: 25,
            ),
            const LogInMiddleSection(),
            const Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'OR',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  // context.read<LoginCubit>().signInWithGoogle();
                },
                icon: Image.asset(
                  'assets/Logo/google_icon.png',
                  height: 20,
                  width: 20,
                ),
                label: Text(
                  'Login with Google',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black.withOpacity(.5)),
                ),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: BorderSide(color: Colors.grey[300]!),
                  shape: const RoundedRectangleBorder(),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  r'Don’t have a account? ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      letterSpacing: .5,
                      color: Colors.black.withOpacity(.6),
                      fontStyle: FontStyle.normal),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const SignupPage();
                    }));
                  },
                  child: const Text(
                    'Register',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                        letterSpacing: .5,
                        color: Color(0xff40BFFF),
                        fontStyle: FontStyle.normal),
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
