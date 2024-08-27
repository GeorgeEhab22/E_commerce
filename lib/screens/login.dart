import 'package:e_commerce/cubits/login_cubit/login_cubit.dart';
import 'package:e_commerce/screens/HomePage.dart';
import 'package:e_commerce/widgets/log_in_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          }
        },
        child: const LogInBody(),
      ),
    );
  }
}
