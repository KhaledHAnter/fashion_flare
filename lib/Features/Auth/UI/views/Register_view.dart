// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_flare/Core/Helper/auth_services/auth_services.dart';
import 'package:fashion_flare/Core/Helper/constants.dart';
import 'package:fashion_flare/Core/Helper/extentions.dart';
import 'package:fashion_flare/Core/routing/routes.dart';
import 'package:fashion_flare/core/Helper/show_snackbar.dart';
import 'package:fashion_flare/Core/Services/FireBase%20Services/auth_service.dart';
import 'package:fashion_flare/Core/widgets/app_text.dart';
import 'package:fashion_flare/Core/widgets/app_text_form_field.dart';
import 'package:fashion_flare/Core/widgets/custom_button.dart';
import 'package:fashion_flare/Features/Auth/UI/widgets/social_media_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String? email, password, rPassword;
  bool obscureText = true,
      rObscureText = true,
      autoValidate = false,
      termsAgreed = false,
      argumentError = false,
      isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: LoadingAnimationWidget.threeArchedCircle(
                color: Colors.redAccent,
                size: 100,
              ),
            )
          : Padding(
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
                      AppText(
                        text: "Create Account",
                        size: 40.sp,
                        weight: FontWeight.w700,
                      ),
                      Gap(8.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 70),
                        child: AppText(
                          text:
                              "Fill your information below or register with your social account.",
                          size: 14.sp,
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
                                rPassword = p0;
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
                              obscureText: rObscureText,
                              suffixIcon: rObscureText
                                  ? FontAwesomeIcons.eye
                                  : FontAwesomeIcons.eyeSlash,
                              onSuffixTap: () {
                                setState(() {
                                  rObscureText = !rObscureText;
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
                            argumentError ? argumentError = false : null;
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
                            AppText(
                              text: "Agree with ",
                              size: 16.sp,
                              weight: FontWeight.w700,
                            ),
                            AppText(
                              text: "Terms & Conditions",
                              size: 18.sp,
                              weight: FontWeight.w700,
                              decoretions: TextDecoration.underline,
                            ),
                          ],
                        ),
                      ),
                      Gap(8.h),
                      Visibility(
                        visible: argumentError,
                        child: AppText(
                          text: "you must accept terms and conditions",
                          color: Colors.red,
                          size: 18.sp,
                        ),
                      ),
                      Gap(24.h),
                      CustomButton(
                        text: "Register",
                        onTap: () async {
                          if (termsAgreed == false) {
                            setState(() {
                              argumentError = true;
                            });
                          } else if (formKey.currentState!.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            try {
                              await registerUser(
                                  email: email, password: password);

                              context.pushNamed(Routes.userDetails);

                              showSnackbar(
                                context,
                                "Successful Registration",
                                Colors.green,
                              );
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'email-already-in-use') {
                                showSnackbar(
                                  context,
                                  "Email already exist",
                                  Colors.redAccent,
                                );
                              }
                            }
                            setState(() {
                              isLoading = false;
                            });
                          } else {
                            setState(() {
                              autoValidate = true;
                            });
                          }
                        },
                      ),
                      Gap(40.h),
                      AppText(
                        text: "Or sign up with",
                        size: 14.sp,
                        weight: FontWeight.w700,
                        color: kSecondaryFontColor,
                      ),
                      Gap(24.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            SocialMediaIcon(
                              image: "assets/Icons/Google.png",
                              onTap: () {
                                handleRegister(context);
                              },
                            ),
                          ],
                        ),
                      ),
                      Gap(24.h),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Already have an account? ",
                              style: TextStyle(
                                  fontFamily: kFontFamily,
                                  color: kSecondaryFontColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                            TextSpan(
                              text: "Sign In",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  context.pushNamed(Routes.signInView);
                                },
                              style: TextStyle(
                                fontFamily: kFontFamily,
                                color: const Color(0XFF4A4A68),
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.underline,
                                decorationColor: const Color(0xff4A4A68),
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

  Future handleRegister(BuildContext context) async {
    AuthServices authServices = AuthServices();
    User? user = await authServices.signInWithGoogle();
    if (user != null) {
      bool isRegistered = await isUserRegistered(user.email!);
      if (!isRegistered) {
        context.pushNamedAndRemoveUntil(Routes.userDetails,
            predicate: (Route<dynamic> route) => false);
      } else {
        context.pushNamedAndRemoveUntil(Routes.navHomeView,
            predicate: (Route<dynamic> route) => false);
      }
    }
  }

  Future<bool> isUserRegistered(String email) async {
    final DocumentSnapshot userSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(email).get();

    // Check if user document exists in Firestore
    return userSnapshot.exists;
  }
}
