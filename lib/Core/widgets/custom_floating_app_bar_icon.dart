import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Helper/constants.dart';
import '../Helper/extentions.dart';
import 'app_text.dart';
import 'cutom_icon_button.dart';

class CustomFloatingAppBarIcon extends StatelessWidget {
  const CustomFloatingAppBarIcon(
      {super.key,
      required this.title,
      required this.image,
      required this.icon,
      this.onTap});

  final String title, image;
  final IconData icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CustomIconButton(
          onTap: () => context.pop(),
          icon: icon,
        ),
        AppText(
          text: title,
          size: 26.sp,
          weight: FontWeight.w700,
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
