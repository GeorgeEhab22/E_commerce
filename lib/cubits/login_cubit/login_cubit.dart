import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
  import 'package:flutter/foundation.dart'; // Import for logging

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> userLogin({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(LoginFailure(errorMsg: 'Weak password'));
      } else if (e.code == 'email-already-in-use') {
        emit(LoginFailure(errorMsg: 'Email already exists'));
      } else if (e.code == 'invalid-email') {
        emit(LoginFailure(errorMsg: 'Email is invalid'));
      } else {
        emit(LoginFailure(errorMsg: 'Password is incorrect'));
      }
    } catch (e) {
      emit(LoginFailure(errorMsg: 'Something went wrong'));
    }
  }


Future<void> signInWithGoogle() async {
  emit(LoginLoading());
  try {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      // User canceled the sign-in
      emit(LoginFailure(errorMsg: 'Google sign-in was canceled'));
      return;
    }

    // Log the Google user's email for debugging purposes
    debugPrint('Google user signed in: ${googleUser.email}');

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Log the obtained tokens for debugging (don't log these in production!)
    debugPrint('Access token: ${googleAuth.accessToken}');
    debugPrint('ID token: ${googleAuth.idToken}');

    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential userCredential = await _auth.signInWithCredential(credential);

    if (userCredential.user != null) {
      debugPrint('Firebase user signed in: ${userCredential.user?.email}');
      emit(LoginSuccess());
    } else {
      emit(LoginFailure(errorMsg: 'Login failed. Please try again.'));
    }
  } catch (e) {
    // Log the error message
    debugPrint('Google sign-in error: $e');
    emit(LoginFailure(errorMsg: 'An error occurred: ${e.toString()}'));
  }
}

}
