import 'package:e_commerce/api/firebase_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  signInAction() async {
    if (formKey.currentState!.validate()) {
      await FireBaseHelper()
          .signIn(
            emailController.text.toString(),
            passwordController.text.toString(),
          )
          .then((value) => {
                if (value is User)
                  {
                    emit(LoginSuccess()),
                    emailController.clear(),
                    passwordController.clear()
                  }
                else
                  {emit(LoginError(message: value.toString()))}
              });
    }
  }
}