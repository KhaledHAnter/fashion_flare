import 'package:fashion_flare/Widgets/app_text.dart';
import 'package:fashion_flare/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.text, this.onTap, this.height});
  final String text;
  final void Function()? onTap;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(minHeight: 70.h),
        width: double.infinity,
        height: height,
        decoration: const BoxDecoration(
          color: kPrimaryColor,
        ),
        child: Center(
          child: AppText(
            text: text,
            size: 22.sp,
            weight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
