// ignore_for_file: use_build_context_synchronously
import 'dart:developer';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_flare/Core/Helper/auth_services/auth_services.dart';
import 'package:fashion_flare/Core/Helper/constants.dart';
import 'package:fashion_flare/Core/Helper/extentions.dart';
import 'package:fashion_flare/Core/routing/routes.dart';
import 'package:fashion_flare/Core/widgets/app_text.dart';
import 'package:fashion_flare/Core/widgets/app_text_form_field.dart';
import 'package:fashion_flare/Core/widgets/custom_button.dart';
import 'package:fashion_flare/Core/Services/FireBase%20Services/auth_service.dart';
import 'package:fashion_flare/Features/Auth/UI/widgets/social_media_icons.dart';
import 'package:fashion_flare/core/Helper/show_awsome_snakbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  String? email, password;
  bool obscureText = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool autoValidate = false, isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: LoadingAnimationWidget.threeArchedCircle(
                  color: Colors.redAccent, size: 100),
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
                        text: "Sign In",
                        size: 40.sp,
                        weight: FontWeight.w700,
                      ),
                      Gap(8.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 70),
                        child: AppText(
                          text:
                              "Welcome back! Let's continue your style journey together.",
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
                          ],
                        ),
                      ),
                      Gap(8.h),
                      GestureDetector(
                        onTap: () {
                          context.pushNamed(Routes.forgotPassword);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            AppText(
                              text: "Forget password?        ",
                              size: 14.sp,
                              weight: FontWeight.w700,
                              color: kSecondaryFontColor,
                            ),
                          ],
                        ),
                      ),
                      Gap(24.h),
                      CustomButton(
                        text: "Sign In",
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            try {
                              await loginUser(email: email, password: password);
                              context.pushNamedAndRemoveUntil(
                                  Routes.navHomeView,
                                  predicate: (Route<dynamic> route) => false);
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'wrong-password') {
                                showAwsomeSnakBar(
                                  context,
                                  message: "",
                                  title: "Wrong Password",
                                  type: ContentType.failure,
                                );
                              } else if (e.code == 'user-not-found') {
                                showAwsomeSnakBar(
                                  context,
                                  message: "",
                                  title: "User Not Found",
                                  type: ContentType.failure,
                                );
                              } else {
                                log(e.toString());
                              }
                            } catch (ex) {
                              log(ex.toString());
                              showAwsomeSnakBar(
                                context,
                                message: "",
                                title: "There was an error",
                                type: ContentType.failure,
                              );
                            }
                            setState(
                              () {
                                isLoading = false;
                              },
                            );

                            print("Vaild");
                          } else {
                            print("invalid");
                            setState(() {
                              autoValidate = true;
                            });
                          }
                        },
                      ),
                      Gap(40.h),
                      AppText(
                        text: "Or continue with",
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SocialMediaIcon(
                              image: "assets/Icons/Google.png",
                              onTap: () {
                                handleSignIn(context);
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
                              text: "Don't have an account? ",
                              style: TextStyle(
                                  fontFamily: kFontFamily,
                                  color: kSecondaryFontColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  context.pushNamed(Routes.registerView);
                                },
                              text: "Sign Up",
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

  Future handleSignIn(BuildContext context) async {
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
