import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, required this.isActive});
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: isActive ? Colors.black : const Color(0XFF8C8CA1),
        borderRadius: BorderRadius.circular(12),
      ),
      height: 7.5.h,
      width: isActive ? 16.h : 10.h,
    );
  }
}
