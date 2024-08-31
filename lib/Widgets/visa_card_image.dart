import 'package:fashion_flare/Widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VisaCardImage extends StatelessWidget {
  const VisaCardImage({
    super.key,
    required this.cardNumber,
    required this.expiryDate,
    required this.cardHolderName,
  });

  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      constraints: BoxConstraints(minHeight: 270.h, minWidth: 350.w),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/Images/visa.png"),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 50.w,
          bottom: 60.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AppText(
              text: cardNumber,
              size: 18.sp,
              weight: FontWeight.w700,
              color: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.only(left: 150.w),
              child: AppText(
                text: expiryDate,
                size: 14.sp,
                weight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            AppText(
              letterSpacing: 1,
              wordSpacing: 4,
              text: cardHolderName,
              size: 16.sp,
              weight: FontWeight.w700,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
