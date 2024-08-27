import 'package:e_commerce/cubits/login_cubit.dart';
import 'package:e_commerce/cubits/login_state.dart';
import 'package:e_commerce/screens/HomePage.dart';
import 'package:e_commerce/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Navigations.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const Navigation();
            }));
          } else if (state is LoginError) {
            final snackBarMessage = state.message.isNotEmpty
                ? state.message
                : 'An unknown error occurred. Please try again.';
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(
                  milliseconds: 200,
                ),
                content: Text(snackBarMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
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
                  Form(
                    key: context.read<LoginCubit>().formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: TextFormField(
                            controller: LoginCubit.emailController,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.black.withOpacity(.5)),
                              hintText: 'Your Email',
                              prefixIcon: Icon(Icons.email_outlined,
                                  color: Colors.black.withOpacity(.5)),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 247, 243, 243),
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }

                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: TextFormField(
                            controller: LoginCubit.passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.black.withOpacity(.5)),
                              hintText: 'Password',
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: Colors.black.withOpacity(.5),
                              ),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 247, 243, 243))),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }

                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<LoginCubit>().signInAction();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF40BFFF),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.facebook,
                        color: Colors.blue,
                      ),
                      label: Text(
                        'Login with facebook',
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
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const HomePage();
                      }));
                    },
                    child: const Text(
                      'forget password?',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Don’t have a account? ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            letterSpacing: .5,
                            color: Colors.black.withOpacity(.6),
                            fontStyle: FontStyle.normal),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SignupPage();
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
        },
      ),
    );
  }
}
