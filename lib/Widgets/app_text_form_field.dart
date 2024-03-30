import 'package:fashion_flare/constants.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField(
      {super.key,
      required this.labelText,
      required this.prefixIcon,
      required this.obscureText,
      this.suffixIcon,
      this.onTap});

  final String labelText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      obscureText: obscureText,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon == null
            ? null
            : GestureDetector(
                onTap: onTap,
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
