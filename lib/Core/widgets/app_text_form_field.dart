import '../Helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField(
      {super.key,
      required this.labelText,
      this.prefixIcon,
      this.obscureText,
      this.suffixIcon,
      this.validator,
      this.onChanged,
      this.keyboardType,
      this.autoValidate = false,
      this.controller,
      this.textInputAction,
      this.onFieldSubmitted});

  final String labelText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final bool autoValidate;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      textInputAction: textInputAction ?? TextInputAction.next,
      controller: controller,
      autovalidateMode: autoValidate
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      onChanged: onChanged,
      validator: validator,
      keyboardType: keyboardType ?? TextInputType.text,
      obscureText: obscureText ?? false,
      style: TextStyle(
        color: Colors.black,
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
      ),
      decoration: InputDecoration(
        errorStyle: TextStyle(fontSize: 16.sp),
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.all(18),
        labelText: labelText,
        labelStyle: const TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
        floatingLabelBehavior: null,
        fillColor: kTextFormFieldColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: const BorderSide(
            style: BorderStyle.none,
            width: 0,
          ),
        ),
      ),
    );
  }
}
