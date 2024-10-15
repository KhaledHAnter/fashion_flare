import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import '../../../../Core/Helper/constants.dart';
import '../../../../Core/Helper/extentions.dart';
import '../../../../Core/routing/routes.dart';
import '../../../../Core/widgets/app_button.dart';
import '../../../../Core/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: <Widget>[
            Expanded(
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
            AppButton(
              text: "Get Started",
              onTap: () {
                FirebaseAuth auth = FirebaseAuth.instance;

                if (auth.currentUser != null) {
                  context.pushReplacementNamed(Routes.navHomeView);
                } else {
                  context.pushReplacementNamed(Routes.onBoardingView);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
