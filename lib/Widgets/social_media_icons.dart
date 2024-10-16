import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialMediaIcon extends StatelessWidget {
  const SocialMediaIcon({super.key, this.onTap, required this.image});

  final void Function()? onTap;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40.h,
        width: 40.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
