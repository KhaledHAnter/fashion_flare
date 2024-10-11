import 'package:fashion_flare/Core/routing/app_router.dart';
import 'package:fashion_flare/fashion_flare.dart';
import 'package:fashion_flare/firebase_options.dart';
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
    // statusBarIconBrightness: Brightness.dark,
  ));
  runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => const FashionFalre(),
    // ),
    FashionFlare(
      appRouter: AppRouter(),
    ),
  );
  await ScreenUtil.ensureScreenSize();
}
