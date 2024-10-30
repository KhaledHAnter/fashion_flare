import 'package:fashion_flare/Features/Auth/UI/manager/cubit/signin_state.dart';
import 'package:fashion_flare/Features/Auth/data/repos/sign_in_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninCubit extends Cubit<SigninState> {
  final SignInRepo _signInRepo;
  SigninCubit(this._signInRepo) : super(const SigninState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  /// Method to enable validation once the user interacts after clicking the button
  void enableAutoValidation() {
    autovalidateMode = AutovalidateMode.onUserInteraction;
    emit(const SigninState.initial()); // Re-emit to update the UI
  }

  void signInWithEmail() async {
    final email = emailController.text;
    final password = passwordController.text;

    if (!formKey.currentState!.validate()) {
      enableAutoValidation();
      return;
    }
    emit(const SigninState.loading());
    final response = await _signInRepo.signInWithEmail(email, password);

    response.when(
      success: (data) {
        if (data != null) {
          emit(const SigninState.emailSuccess());
        }
      },
      error: (errMessage) {
        emit(SigninState.emailError(errMessage));
      },
    );
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
