import 'package:e_commerce/cubits/login_cubit.dart';
import 'package:e_commerce/cubits/login_state.dart';
import 'package:e_commerce/helpers/get_snack_bar.dart';
import 'package:e_commerce/widgets/log_in_body.dart';
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
            getShowSnackBar(context, snackBarMessage);
          }
        },
        builder: (context, state) {
          return const LogInBody();
        },
      ),
    );
  }
}
