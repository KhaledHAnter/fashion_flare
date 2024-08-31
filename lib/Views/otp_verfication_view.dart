import 'dart:async';

import 'package:fashion_flare/Widgets/app_text.dart';
import 'package:fashion_flare/Widgets/custom_button.dart';
import 'package:fashion_flare/Widgets/otp_square.dart';
import 'package:fashion_flare/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class OTPverficationView extends StatefulWidget {
  const OTPverficationView({super.key});

  static String id = "OTP Verfication";

  @override
  State<OTPverficationView> createState() => _OTPverficationViewState();
}

class _OTPverficationViewState extends State<OTPverficationView> {
  int timeLift = 25;

  void _startCountdown() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(
          () {
            if (timeLift > 0) {
              timeLift--;
            }
          },
        );
      }
    });
  }

  @override
  void initState() {
    _startCountdown();
    super.initState();
  }

  @override
  void dispose() {
    timeLift = 30;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final phoneNumber = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AppText(
                text: "OTP Veriefication",
                size: 40.sp,
                weight: FontWeight.w700,
              ),
              Gap(8.h),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Enter the OTP sent to ",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: kFontFamily,
                        color: kSecondaryFontColor,
                      ),
                    ),
                    TextSpan(
                      text: phoneNumber,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: kFontFamily,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Gap(40.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    otp.length,
                    (index) => const OTPsquare(),
                  ),
                ),
              ),
              Gap(30.h),
              AppText(
                text: "00:${timeLift.toString()} Sec",
                size: 16.sp,
                color: const Color(0xff464646),
              ),
              Gap(25.h),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Don't receive code ? ",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: kFontFamily,
                        color: const Color(0xff5A5A5A),
                      ),
                    ),
                    TextSpan(
                      text: ' Re-send',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: kFontFamily,
                        color: timeLift == 0
                            ? const Color(0xff464646)
                            : const Color(0xff464646).withOpacity(.3),
                      ),
                    ),
                  ],
                ),
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

List<int> otp = [0, 0, 0, 0];
