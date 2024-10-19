import '../Helper/constants.dart';
import 'app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  final String title, image;
  final Function()? onTap;
  const CustomAppBar({
    super.key,
    required this.title,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const Spacer(
          flex: 3,
        ),
        AppText(
          text: title,
          size: 26.sp,
          weight: FontWeight.w700,
        ),
        const Spacer(
          flex: 2,
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            constraints: BoxConstraints(minHeight: 48.h, minWidth: 44.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: kPrimaryColor,
            ),
            child: Image.asset(image),
          ),
        ),
      ],
    );
  }
}
