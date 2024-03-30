import 'package:fashion_flare/Views/sign_in_view.dart';
import 'package:fashion_flare/Widgets/app_text.dart';
import 'package:fashion_flare/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class UserCredentialsView extends StatelessWidget {
  const UserCredentialsView({super.key});

  static const String id = 'User Credentials';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/Images/3.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Padding(
                  padding: EdgeInsets.only(top: 350.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const AppText(
                        text: "Hello there!",
                        size: 40,
                        weight: FontWeight.w700,
                      ),
                      Gap(12.h),
                      const AppText(
                        text: "Let's find your perfect look together!",
                        size: 16,
                      ),
                      const Spacer(),
                      Container(
                        height: 54.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: const Center(
                          child: AppText(
                            text: 'Register',
                            size: 20,
                            weight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Gap(12.h),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, SignInView.id);
                        },
                        child: Container(
                          height: 54.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: const Center(
                            child: AppText(
                              text: 'Sign In',
                              size: 20,
                              weight: FontWeight.w900,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
