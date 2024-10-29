// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';


// final getIt = GetIt.instance;

// Future<void> setupGetIt() async {
//   // Dio & ApiService
//   Dio dio = DioFactory.getDio();
//   getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

//   // Login
//   getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
//   getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

//   // signup
//   getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
//   getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

//   // Home
//   getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
//   getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
// }
