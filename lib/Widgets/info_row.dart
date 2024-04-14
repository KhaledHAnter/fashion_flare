import 'package:fashion_flare/Widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({
    super.key,
    required this.subtitle,
    required this.title,
  });

  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Row(
        children: [
          AppText(
            text: "$title :    ",
            weight: FontWeight.w700,
            size: 22.sp,
          ),
          AppText(
            text: subtitle,
          ),
        ],
      ),
    );
  }
}
