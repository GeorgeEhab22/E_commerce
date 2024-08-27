
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final formKey = GlobalKey<FormState>();

  static TextEditingController userNameController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  SignUpCubit() : super(SignUpInitial());

  Future<void> signUpAction() async {
    if (formKey.currentState?.validate() ?? false) {
      emit(SignUpLoading());
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text,
                password: passwordController.text);

        if (userCredential.user != null) {
          await userCredential.user?.updateDisplayName(userNameController.text);
          await userCredential.user?.reload();
          emit(SignUpSuccess());
           userNameController.clear();
          emailController.clear();
           passwordController.clear();
        } else {
          emit(SignUpError(message: 'Signup failed. Please try again.'));
        }
      } catch (e) {
        String errorMessage = e.toString();
        if (errorMessage.isEmpty) {
          errorMessage = 'An unknown error occurred. Please try again.';
        }
        emit(SignUpError(message: errorMessage));
      }
    }
  }
}
