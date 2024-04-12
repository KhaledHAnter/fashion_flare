import 'package:fashion_flare/Widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StyleChooseCard extends StatelessWidget {
  const StyleChooseCard({
    super.key,
    required this.title,
    required this.color,
  });

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.h),
      padding: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(32),
      ),
      child: AppText(
        text: title,
        weight: FontWeight.w700,
        size: 18.sp,
      ),
    );
  }
}
