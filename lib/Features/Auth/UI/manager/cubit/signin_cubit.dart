import 'dart:developer';

import 'package:fashion_flare/Features/Auth/UI/manager/cubit/signin_state.dart';
import 'package:fashion_flare/Features/Auth/data/repos/sign_in_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninCubit extends Cubit<SigninState> {
  final SignInRepo _signInRepo;
  SigninCubit(this._signInRepo) : super(const SigninState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isPasswordObscured = true;

  /// Method to enable validation once the user interacts after clicking the button
  void enableAutoValidation() {
    autovalidateMode = AutovalidateMode.onUserInteraction;
    emit(const SigninState.initial()); // Re-emit to update the UI
  }

  /// Method to toggle the password visibility
  void togglePasswordVisibility() {
    isPasswordObscured = !isPasswordObscured;
    emit(const SigninState.initial()); // Re-emit to update the UI
  }

  Future<void> signInWithEmail() async {
    final email = emailController.text;
    final password = passwordController.text;

    if (!formKey.currentState!.validate()) {
      enableAutoValidation();
      return;
    }

    try {
      emit(const SigninState.loading());
      User? user = await _signInRepo.signInWithEmail(email, password);
      if (user != null) {
        emit(const SigninState.emailSuccess());
      }
    } on FirebaseAuthException catch (e) {
      log(e.code);
      if (e.code == 'user-not-found') {
        emit(const SigninState.emailError('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(const SigninState.emailError('Wrong password provided.'));
      } else if (e.code == 'invalid-email') {
        emit(const SigninState.emailError(
            'The email address is badly formatted.'));
      } else if (e.code == 'invalid-credential') {
        emit(const SigninState.emailError(
            'Email and password do not match. Please try again.'));
      } else {
        emit(SigninState.emailError(
            e.message ?? 'An unexpected error occurred.'));
      }
    } catch (e) {
      emit(const SigninState.emailError('An unknown error occurred.'));
    }
  }

  Future<void> signInWithGoogle() async {
    emit(const SigninState.loading());
    bool? isGoogleRegistered = await _signInRepo.handleGoogleSignIn();
    if (isGoogleRegistered != null) {
      if (isGoogleRegistered) {
        emit(const SigninState.googleSuccess());
      } else {
        emit(const SigninState.googleNotRegistered());
      }
    } else {
      emit(const SigninState.googleError());
    }
  }
}
