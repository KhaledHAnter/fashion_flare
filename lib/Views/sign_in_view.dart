import 'package:fashion_flare/Widgets/app_text.dart';
import 'package:fashion_flare/Widgets/app_text_form_field.dart';
import 'package:fashion_flare/Widgets/custom_button.dart';
import 'package:fashion_flare/Widgets/social_media_icons.dart';
import 'package:fashion_flare/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  static const String id = 'Sign In';

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const AppText(
              text: "Sign In",
              size: 40,
              weight: FontWeight.w700,
            ),
            Gap(8.h),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 70),
              child: AppText(
                text:
                    "Welcome back! Let's continue your style journey together.",
                size: 14,
                weight: FontWeight.w700,
                color: kSecondaryFontColor,
              ),
            ),
            Gap(40.h),
            const AppTextFormField(
              labelText: "Email",
              prefixIcon: FontAwesomeIcons.solidEnvelope,
              obscureText: false,
            ),
            Gap(24.h),
            AppTextFormField(
              labelText: "Password",
              prefixIcon: FontAwesomeIcons.lock,
              obscureText: obscureText,
              suffixIcon: obscureText
                  ? FontAwesomeIcons.eye
                  : FontAwesomeIcons.eyeSlash,
              onTap: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
            ),
            Gap(8.h),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppText(
                  text: "Forget password?        ",
                  size: 14,
                  weight: FontWeight.w700,
                  color: kSecondaryFontColor,
                ),
              ],
            ),
            Gap(24.h),
            const CustomButton(text: "Sign In"),
            Gap(40.h),
            const AppText(
              text: "Or continue with",
              size: 14,
              weight: FontWeight.w700,
              color: kSecondaryFontColor,
            ),
            Gap(24.h),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 50,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SocialMediaIcon(image: "assets/Icons/Facebook.png"),
                  SocialMediaIcon(image: "assets/Icons/Apple.png"),
                  SocialMediaIcon(image: "assets/Icons/Google.png"),
                ],
              ),
            ),
            Gap(24.h),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(
                        fontFamily: kFontFamily,
                        color: kSecondaryFontColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                  TextSpan(
                    text: "Sign Up",
                    style: TextStyle(
                      fontFamily: kFontFamily,
                      color: Color(0XFF4A4A68),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xff4A4A68),
                      decorationThickness: 2.0,
                      decorationStyle: TextDecorationStyle.wavy,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
