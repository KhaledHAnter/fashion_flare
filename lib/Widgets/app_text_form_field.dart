import 'package:fashion_flare/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.labelText,
    this.prefixIcon,
    required this.obscureText,
    this.suffixIcon,
    this.onSuffixTap,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.autoValidate = false,
  });

  final String labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final void Function()? onSuffixTap;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final bool autoValidate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autoValidate
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      onChanged: onChanged,
      
      validator: validator,
      keyboardType: keyboardType ?? TextInputType.text,
      obscureText: obscureText,
      style: TextStyle(
        color: Colors.black,
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
      ),
      decoration: InputDecoration(
        errorStyle: TextStyle(fontSize: 16.sp),
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon == null
            ? null
            : GestureDetector(
                onTap: onSuffixTap,
                child: Icon(suffixIcon),
              ),
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
