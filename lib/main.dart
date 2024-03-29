import 'package:fashion_flare/Views/onboarding_view.dart';
import 'package:fashion_flare/Views/welcome_view.dart';
import 'package:fashion_flare/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  runApp(const FashionFalre());
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
      },
      initialRoute: WelcomeView.id,
    );
  }
}
