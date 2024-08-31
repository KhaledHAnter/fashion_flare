import 'package:fashion_flare/Views/otp_verfication_view.dart';
import 'package:fashion_flare/Widgets/app_text.dart';
import 'package:fashion_flare/Widgets/app_text_form_field.dart';
import 'package:fashion_flare/Widgets/custom_button.dart';
import 'package:fashion_flare/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  static String id = 'Forgot Password';

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String? phoneNumber;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AppText(
                text: "Forgot Password?",
                size: 40.sp,
                weight: FontWeight.w700,
              ),
              Gap(8.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: AppText(
                  text:
                      "Don't worry ! It happens. Please enter the phone number we will send the OTP in this phone number.?",
                  size: 16.sp,
                  weight: FontWeight.w500,
                  color: kSecondaryFontColor,
                ),
              ),
              Gap(40.h),
              Form(
                key: formKey,
                child: AppTextFormField(
                  autoValidate: autoValidate,
                  validator: (value) {
                    if (!(value!.length == 11)) {
                      return "Invalid Phone Number";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {});
                    phoneNumber = value;
                  },
                  keyboardType: TextInputType.phone,
                  labelText: "Phone Number",
                  prefixIcon: FontAwesomeIcons.phone,
                  obscureText: false,
                ),
              ),
              Gap(45.h),
              CustomButton(
                text: "Continue",
                color: phoneNumber == null
                    ? kSecondaryFontColor.withOpacity(0.5)
                    : kPrimaryColor,
                onTap: () {
                  if (!(phoneNumber == null || phoneNumber!.isEmpty) &&
                      formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, OTPverficationView.id,
                        arguments: phoneNumber);
                  } else {
                    setState(() {
                      autoValidate = true;
                    });
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
