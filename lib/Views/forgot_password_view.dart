import 'package:fashion_flare/Widgets/app_text.dart';
import 'package:fashion_flare/Widgets/app_text_form_field.dart';
import 'package:fashion_flare/Widgets/custom_button.dart';
import 'package:fashion_flare/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  static String id = 'Forgot Password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const AppText(
                text: "Forgot Password?",
                size: 40,
                weight: FontWeight.w700,
              ),
              Gap(8.h),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: AppText(
                  text:
                      "Don't worry ! It happens. Please enter the phone number we will send the OTP in this phone number.?",
                  size: 16,
                  weight: FontWeight.w500,
                  color: kSecondaryFontColor,
                ),
              ),
              Gap(40.h),
              const AppTextFormField(
                keyboardType: TextInputType.phone,
                labelText: "Phone Number",
                prefixIcon: FontAwesomeIcons.phone,
                obscureText: false,
              ),
              Gap(45.h),
              const CustomButton(text: "Continue")
            ],
          ),
        ),
      ),
    );
  }
}
