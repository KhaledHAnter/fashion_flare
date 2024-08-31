import 'package:fashion_flare/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppText extends StatelessWidget {
  const AppText({
    super.key,
    required this.text,
    this.size,
    this.color,
    this.weight,
    this.textAlign,
    this.decoretions,
    this.wordSpacing,
    this.letterSpacing,
  });

  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final TextAlign? textAlign;
  final TextDecoration? decoretions;
  final double? wordSpacing;
  final double? letterSpacing;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        wordSpacing: wordSpacing,
        letterSpacing: letterSpacing,
        fontFamily: kFontFamily,
        color: color ?? Colors.black,
        fontSize: size ?? 20.sp,
        fontWeight: weight ?? FontWeight.w500,
        decoration: decoretions,
      ),
      textAlign: textAlign ?? TextAlign.center,
    );
  }
}
