// ignore_for_file: use_build_context_synchronously
import 'dart:developer';

import 'package:fashion_flare/Core/Helper/constants.dart';
import 'package:fashion_flare/Core/Helper/extentions.dart';
import 'package:fashion_flare/Core/Helper/validator_utils/validator_utils.dart';
import 'package:fashion_flare/Core/routing/routes.dart';
import 'package:fashion_flare/Core/widgets/app_text.dart';
import 'package:fashion_flare/Core/widgets/app_text_form_field.dart';
import 'package:fashion_flare/Core/widgets/custom_button.dart';
import 'package:fashion_flare/Features/Auth/UI/manager/sigin_in_cubit/signin_cubit.dart';
import 'package:fashion_flare/Features/Auth/UI/manager/sigin_in_cubit/signin_state.dart';
import 'package:fashion_flare/Features/Auth/UI/widgets/sign_in_bloc_listener.dart';
import 'package:fashion_flare/Features/Auth/UI/widgets/social_media_icons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  bool isObscured = true;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SigninCubit>();
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
                BlocBuilder<SigninCubit, SigninState>(
                  builder: (context, state) {
                    log("object");
                    GlobalKey<FormState> formKey = cubit.formKey;

                    return Builder(builder: (context) {
                      return Form(
                        key: formKey,
                        autovalidateMode: cubit.autovalidateMode,
                        child: Column(
                          children: [
                            AppTextFormField(
                              labelText: "Email",
                              controller: cubit.emailController,
                              validator: ValidatorUtils.validateEmail,
                              keyboardType: TextInputType.emailAddress,
                              prefixIcon: FontAwesomeIcons.solidEnvelope,
                              obscureText: false,
                            ),
                            Gap(24.h),
                            AppTextFormField(
                              labelText: "Password",
                              controller: cubit.passwordController,
                              validator: ValidatorUtils.validatePassword,
                              prefixIcon: FontAwesomeIcons.lock,
                              obscureText: isObscured,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isObscured = !isObscured;
                                  });
                                },
                                icon: Icon(
                                  color: Colors.black,
                                  isObscured
                                      ? FontAwesomeIcons.eye
                                      : FontAwesomeIcons.eyeSlash,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    });
                  },
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
                    print("Shgal");
                    cubit.signInWithEmail();
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
                          cubit.signInWithGoogle();
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
                ),
                const SignInBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
