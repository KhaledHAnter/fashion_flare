import 'package:fashion_flare/constants.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText({
    super.key,
    required this.text,
    this.size,
    this.color,
    this.weight,
    this.textAlign,
  });

  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: kFontFamily,
        color: color ?? Colors.black,
        fontSize: size ?? 20,
        fontWeight: weight ?? FontWeight.w500,
      ),
      textAlign: textAlign ?? TextAlign.center,
    );
  }
}
