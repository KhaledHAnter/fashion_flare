import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_flare/Features/Auth/UI/manager/cubit/signin_state.dart';
import 'package:fashion_flare/Features/Auth/data/repos/sign_in_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninCubit extends Cubit<SigninState> {
  final SignInRepo _signInRepo;
  final FirebaseFirestore _firestore;
  SigninCubit(this._signInRepo, this._firestore)
      : super(const SigninState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  Future<bool> isUserRegistered(String email) async {
    final DocumentSnapshot userSnapshot =
        await _firestore.collection('users').doc(email).get();

    // Check if user document exists in Firestore
    return userSnapshot.exists;
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
