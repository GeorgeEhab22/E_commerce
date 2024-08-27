import 'package:e_commerce/Navigations.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/cubits/login_cubit/login_cubit.dart';
import 'package:e_commerce/widgets/log_in_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool flag = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Navigation(),
            ),
          );
        } else if (state is LoginLoading) {
          flag = true;
          setState(() {});
        }
      },
      child: ModalProgressHUD(
        progressIndicator: const CircularProgressIndicator(
          color: primaryColor,
        ),
        blur: 4,
        color: Colors.white,
        inAsyncCall: flag,
        child: const Scaffold(
          body: Center(
            child: LogInBody(),
          ),
        ),
      ),
    );
  }
}
