import '../../../../Core/Helper/constants.dart';
import '../../../../Core/Helper/extentions.dart';
import '../../../../Core/routing/routes.dart';
import '../../../../Core/widgets/app_text.dart';
import '../../../../Core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class UserCredentialsView extends StatelessWidget {
  const UserCredentialsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/Images/113.png"),
                  fit: BoxFit.contain,
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Spacer(),
                    AppText(
                      text: "Hello there!",
                      size: 40.sp,
                      weight: FontWeight.w700,
                    ),
                    Gap(12.h),
                    AppText(
                      text: "Let's find your perfect look together!",
                      size: 16.sp,
                    ),
                    const Spacer(),
                    CustomButton(
                      text: "Register",
                      onTap: () {
                        context.pushNamed(Routes.registerView);
                      },
                    ),
                    Gap(12.h),
                    CustomButton(
                      text: "Sign In",
                      color: Colors.black,
                      textColor: kPrimaryColor,
                      onTap: () {
                        context.pushNamed(Routes.signInView);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
