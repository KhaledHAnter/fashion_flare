import 'Core/di/dependency_injection.dart';

import 'Core/routing/app_router.dart';
import 'fashion_flare.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  await setupGetIt(); // Initialize dependencies
  runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) =>  FashionFlare(appRouter: AppRouter(),),
    // ),
    FashionFlare(
      appRouter: AppRouter(),
    ),
  );
  await ScreenUtil.ensureScreenSize();
}
