import 'package:fashion_flare/Features/Auth/UI/manager/forgot_pass_cubit/forgot_pass_state.dart';
import 'package:fashion_flare/Features/Auth/data/repos/forgot_pass_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPassCubit extends Cubit<ForgotPassState> {
  final ForgotPassRepo _forgotPassRepo;
  ForgotPassCubit(this._forgotPassRepo)
      : super(const ForgotPassState.initial());

  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  /// Method to enable validation once the user interacts after clicking the button
  void enableAutoValidation() {
    autovalidateMode = AutovalidateMode.onUserInteraction;
    emit(const ForgotPassState.initial()); // Re-emit to update the UI
  }

  void sendPasswordResetEmail() async {
    final email = emailController.text;

    if (!formKey.currentState!.validate()) {
      enableAutoValidation();
      return;
    }
    emit(const ForgotPassState.loading());
    final response = await _forgotPassRepo.sendResetPasswordEmail(email);

    response.when(
      success: (data) {
        emit(const ForgotPassState.sentSuccess());
      },
      error: (errMessage) {
        emit(ForgotPassState.sentError(errMessage));
      },
    );
  }
}
