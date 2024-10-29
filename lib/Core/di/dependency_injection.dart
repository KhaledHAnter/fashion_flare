import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_flare/Core/Helper/auth_services/auth_services.dart';
import 'package:fashion_flare/Features/Auth/UI/manager/cubit/signin_cubit.dart';
import 'package:fashion_flare/Features/Auth/data/repos/sign_in_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // AuthServices
  AuthServices authServices = AuthServices();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Signin
  getIt.registerLazySingleton<SignInRepo>(() => SignInRepo(authServices));
  getIt.registerFactory<SigninCubit>(
      () => SigninCubit(getIt<SignInRepo>(), firestore));
}
