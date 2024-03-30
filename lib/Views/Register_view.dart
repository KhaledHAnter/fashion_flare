import 'package:fashion_flare/Views/sign_in_view.dart';
import 'package:fashion_flare/Widgets/app_text.dart';
import 'package:fashion_flare/Widgets/app_text_form_field.dart';
import 'package:fashion_flare/Widgets/custom_button.dart';
import 'package:fashion_flare/Widgets/social_media_icons.dart';
import 'package:fashion_flare/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  static String id = "Resgister";

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String? email, password, Rpassword;
  bool obscureText = true,
      RobscureText = true,
      autoValidate = false,
      termsAgreed = false,
      ArgumentError = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const AppText(
                  text: "Create Account",
                  size: 40,
                  weight: FontWeight.w700,
                ),
                Gap(8.h),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 70),
                  child: AppText(
                    text:
                        "Fill your information below or register with your social account.",
                    size: 14,
                    weight: FontWeight.w700,
                    color: kSecondaryFontColor,
                  ),
                ),
                Gap(40.h),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      AppTextFormField(
                        autoValidate: autoValidate,
                        labelText: "Email",
                        onChanged: (p0) {
                          email = p0;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!(value.contains('.com') &&
                              value.contains('@'))) {
                            return 'Invalid Email';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: FontAwesomeIcons.solidEnvelope,
                        obscureText: false,
                      ),
                      Gap(24.h),
                      AppTextFormField(
                        autoValidate: autoValidate,
                        labelText: "Password",
                        onChanged: (p0) {
                          password = p0;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 8) {
                            return 'password must be at least 8 characters';
                          }
                          return null;
                        },
                        prefixIcon: FontAwesomeIcons.lock,
                        obscureText: obscureText,
                        suffixIcon: obscureText
                            ? FontAwesomeIcons.eye
                            : FontAwesomeIcons.eyeSlash,
                        onSuffixTap: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                      ),
                      Gap(24.h),
                      AppTextFormField(
                        autoValidate: autoValidate,
                        labelText: "Retype Password",
                        onChanged: (p0) {
                          Rpassword = p0;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 8 || !(value == password)) {
                            return 'Passwords do not match';
                          }

                          return null;
                        },
                        prefixIcon: FontAwesomeIcons.lock,
                        obscureText: RobscureText,
                        suffixIcon: RobscureText
                            ? FontAwesomeIcons.eye
                            : FontAwesomeIcons.eyeSlash,
                        onSuffixTap: () {
                          setState(() {
                            RobscureText = !RobscureText;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Gap(8.h),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      termsAgreed = !termsAgreed;
                      ArgumentError ? ArgumentError = false : null;
                    });
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(
                        termsAgreed
                            ? FontAwesomeIcons.squareCheck
                            : FontAwesomeIcons.square,
                        // size: 25,
                      ),
                      Gap(4.w),
                      const AppText(
                        text: "Agree with ",
                        size: 16,
                        weight: FontWeight.w700,
                      ),
                      const AppText(
                        text: "Terms & Conditions",
                        size: 18,
                        weight: FontWeight.w700,
                        decoretions: TextDecoration.underline,
                      ),
                    ],
                  ),
                ),
                Gap(8.h),
                Visibility(
                  visible: ArgumentError,
                  child: const AppText(
                    text: "you must accept terms and conditions",
                    color: Colors.red,
                    size: 18,
                  ),
                ),
                Gap(24.h),
                CustomButton(
                  text: "Register",
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      print("Vaild");
                    } else if (termsAgreed == false) {
                      setState(() {
                        ArgumentError = true;
                      });
                    } else {
                      print("invalid");
                      setState(() {
                        autoValidate = true;
                      });
                    }
                  },
                ),
                Gap(40.h),
                const AppText(
                  text: "Or sign up with",
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
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(
                            fontFamily: kFontFamily,
                            color: kSecondaryFontColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                      TextSpan(
                        text: "Sign In",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, SignInView.id);
                          },
                        style: const TextStyle(
                          fontFamily: kFontFamily,
                          color: Color(0XFF4A4A68),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xff4A4A68),
                          decorationThickness: 2.0,
                          decorationStyle: TextDecorationStyle.dashed,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
