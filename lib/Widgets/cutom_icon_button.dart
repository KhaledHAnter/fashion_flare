import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {super.key, required this.icon, this.size, this.onTap});

  final IconData icon;
  final double? size;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(minHeight: 50.h, minWidth: 50.w),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0XFFECF1F4),
        ),
        child: Icon(
          icon,
          size: size ?? 25.sp,
        ),
      ),
    );
  }
}
