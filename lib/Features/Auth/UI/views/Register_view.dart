// ignore_for_file: file_names

import 'package:fashion_flare/Core/Helper/constants.dart';
import 'package:fashion_flare/Core/Helper/extentions.dart';
import 'package:fashion_flare/Core/Helper/validator_utils/validator_utils.dart';
import 'package:fashion_flare/Core/routing/routes.dart';
import 'package:fashion_flare/Core/widgets/app_text.dart';
import 'package:fashion_flare/Core/widgets/app_text_form_field.dart';
import 'package:fashion_flare/Core/widgets/custom_button.dart';
import 'package:fashion_flare/Features/Auth/UI/manager/register_cubit/register_cubit.dart';
import 'package:fashion_flare/Features/Auth/UI/manager/register_cubit/register_state.dart';
import 'package:fashion_flare/Features/Auth/UI/widgets/register_bloc_listener.dart';
import 'package:fashion_flare/Features/Auth/UI/widgets/social_media_icons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool obscureText = true, rObscureText = true;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();
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
                BlocBuilder<RegisterCubit, RegisterState>(
                  builder: (context, state) {
                    return Form(
                      key: cubit.formKey,
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
                            obscureText: obscureText,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscureText = !obscureText;
                                });
                              },
                              icon: Icon(
                                color: Colors.black,
                                obscureText
                                    ? FontAwesomeIcons.eye
                                    : FontAwesomeIcons.eyeSlash,
                              ),
                            ),
                          ),
                          Gap(24.h),
                          AppTextFormField(
                            labelText: "Retype Password",
                            validator: (value) =>
                                ValidatorUtils.validatePasswordConfirmation(
                                    value, cubit.passwordController.text),
                            prefixIcon: FontAwesomeIcons.lock,
                            obscureText: rObscureText,
                            textInputAction: TextInputAction.done,
                            onFieldSubmitted: (p0) => cubit.registerWithEmail(),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  rObscureText = !rObscureText;
                                });
                              },
                              icon: Icon(
                                color: Colors.black,
                                rObscureText
                                    ? FontAwesomeIcons.eye
                                    : FontAwesomeIcons.eyeSlash,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Gap(24.h),
                CustomButton(
                  text: "Register",
                  onTap: () async {
                    cubit.registerWithEmail();
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
                          cubit.signInWithGoogle();
                          // handleRegister(context);
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
                        ),
                      ),
                    ],
                  ),
                ),
                const RegisterBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
