import 'package:fashion_flare/Features/Auth/UI/manager/register_cubit/register_state.dart';
import 'package:fashion_flare/Features/Auth/data/repos/register_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo _registerRepo;
  RegisterCubit(this._registerRepo) : super(const RegisterState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  /// Method to enable validation once the user interacts after clicking the button
  void enableAutoValidation() {
    autovalidateMode = AutovalidateMode.onUserInteraction;
    emit(const RegisterState.initial()); // Re-emit to update the UI
  }

  void registerWithEmail() async {
    final email = emailController.text;
    final password = passwordController.text;

    if (!formKey.currentState!.validate()) {
      enableAutoValidation();
      return;
    }
    emit(const RegisterState.loading());
    final response = await _registerRepo.registerWithEmail(email, password);

    response.when(
      success: (data) {
        if (data != null) {
          emit(const RegisterState.emailSuccess());
        }
      },
      error: (errMessage) {
        emit(RegisterState.emailError(errMessage));
      },
    );
  }

  Future<void> signInWithGoogle() async {
    emit(const RegisterState.loading());
    bool? isGoogleRegistered = await _registerRepo.handleGoogleSignIn();
    if (isGoogleRegistered != null) {
      if (isGoogleRegistered) {
        emit(const RegisterState.googleSuccess());
      } else {
        emit(const RegisterState.googleNotRegistered());
      }
    } else {
      emit(const RegisterState.googleError());
    }
  }
}
