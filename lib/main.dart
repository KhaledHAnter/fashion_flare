import 'package:device_preview/device_preview.dart';
import 'package:fashion_flare/Views/Register_view.dart';
import 'package:fashion_flare/Views/choose_style_view.dart';
import 'package:fashion_flare/Views/forgot_password_view.dart';
import 'package:fashion_flare/Views/home_view.dart';
import 'package:fashion_flare/Views/onboarding_view.dart';
import 'package:fashion_flare/Views/otp_verfication_view.dart';
import 'package:fashion_flare/Views/sign_in_view.dart';
import 'package:fashion_flare/Views/user_credentials_view.dart';
import 'package:fashion_flare/Views/user_details_view.dart';
import 'package:fashion_flare/Views/welcome_view.dart';
import 'package:fashion_flare/Views/your_3d_model.dart';
import 'package:fashion_flare/constants.dart';
import 'package:fashion_flare/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const FashionFalre(),
    ),
  );
  await ScreenUtil.ensureScreenSize();
}

class FashionFalre extends StatelessWidget {
  const FashionFalre({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        ScreenUtil.init(
          context,
          designSize: const Size(414, 854),
        );
        return child!;
      },
      debugShowCheckedModeBanner: false,
      title: 'Fashion Flare',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        fontFamily: kFontFamily,
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      routes: {
        WelcomeView.id: (context) => const WelcomeView(),
        OnBoardingView.id: (context) => const OnBoardingView(),
        UserCredentialsView.id: (context) => const UserCredentialsView(),
        SignInView.id: (context) => const SignInView(),
        RegisterView.id: (context) => const RegisterView(),
        ForgotPassword.id: (context) => const ForgotPassword(),
        OTPverficationView.id: (context) => const OTPverficationView(),
        UserDetails.id: (context) => const UserDetails(),
        ChooseStyleView.id: (context) => const ChooseStyleView(),
        Your3DModel.id: (context) => const Your3DModel(),
        HomeView.id: (context) => const HomeView(),
      },
      initialRoute: HomeView.id,
    );
  }
}
