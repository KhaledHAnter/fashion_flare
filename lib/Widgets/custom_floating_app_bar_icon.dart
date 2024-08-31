import 'package:fashion_flare/Widgets/app_text.dart';
import 'package:fashion_flare/Widgets/cutom_icon_button.dart';
import 'package:fashion_flare/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          onTap: () => Navigator.pop(context),
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
