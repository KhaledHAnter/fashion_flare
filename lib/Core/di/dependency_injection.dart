import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_flare/Core/Helper/auth_services/auth_services.dart';
import 'package:fashion_flare/Features/Auth/UI/manager/forgot_pass_cubit/forgot_pass_cubit.dart';
import 'package:fashion_flare/Features/Auth/UI/manager/register_cubit/register_cubit.dart';
import 'package:fashion_flare/Features/Auth/UI/manager/sigin_in_cubit/signin_cubit.dart';
import 'package:fashion_flare/Features/Auth/data/repos/forgot_pass_repo.dart';
import 'package:fashion_flare/Features/Auth/data/repos/register_repo.dart';
import 'package:fashion_flare/Features/Auth/data/repos/sign_in_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // AuthServices
  AuthServices authServices = AuthServices();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Signin
  getIt.registerLazySingleton<SignInRepo>(
      () => SignInRepo(authServices, firestore));
  getIt.registerFactory<SigninCubit>(() => SigninCubit(getIt<SignInRepo>()));

  // Register
  getIt.registerLazySingleton<RegisterRepo>(
      () => RegisterRepo(authServices, firestore));
  getIt.registerFactory<RegisterCubit>(
      () => RegisterCubit(getIt<RegisterRepo>()));

  // Foregot Password
  getIt.registerLazySingleton<ForgotPassRepo>(
      () => ForgotPassRepo(authServices, firestore));
  getIt.registerFactory<ForgotPassCubit>(
      () => ForgotPassCubit(getIt<ForgotPassRepo>()));
}
