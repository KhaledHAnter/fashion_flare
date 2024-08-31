import 'package:fashion_flare/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OTPsquare extends StatelessWidget {
  const OTPsquare({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62.h,
      width: 58.w,
      child: Center(
        child: TextFormField(
          showCursor: false,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: "-",
            hintStyle: TextStyle(
              color: kSecondaryFontColor.withOpacity(0.5),
            ),
          ),
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty) {
              FocusScope.of(context).previousFocus();
            }
          },
          style: Theme.of(context).textTheme.headlineLarge,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
        ),
      ),
    );
  }
}
