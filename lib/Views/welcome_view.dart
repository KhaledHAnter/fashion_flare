import 'package:fashion_flare/Core/Helper/constants.dart';
import 'package:fashion_flare/Features/Onboarding/UI/views/onboarding_view.dart';
import 'package:fashion_flare/Widgets/app_button.dart';
import 'package:fashion_flare/Widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 11,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/Images/1.1.png"),
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      AppText(
                        text: "Welcome To",
                        size: 24.sp,
                        weight: FontWeight.w700,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Image.asset(
                            "assets/Icons/1.2.png",
                            color: kLogoColor,
                          ),
                          Gap(10.w),
                          AppText(
                            text: "Fashion Flare",
                            size: 40.sp,
                            weight: FontWeight.w700,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: AppButton(
                text: "Get Started",
                onTap: () {
                  Navigator.pushNamed(context, OnBoardingView.id);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
