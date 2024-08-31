import 'package:fashion_flare/Widgets/app_text.dart';
import 'package:fashion_flare/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class DiscountItemCard extends StatelessWidget {
  const DiscountItemCard({
    super.key,
    this.onTap,
    required this.imagePath,
    required this.itemFav,
    required this.title,
    required this.index,
    required this.newPrice,
    required this.oldPrice,
  });

  final void Function()? onTap;
  final String imagePath, title, newPrice, oldPrice;
  final bool itemFav;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 170.w,
          height: 170.h,
          decoration: BoxDecoration(
            color: const Color(0XFFECF1F4),
            borderRadius: index.isOdd
                ? BorderRadius.only(
                    topLeft: Radius.circular(50.r),
                    bottomLeft: Radius.circular(50.r),
                    bottomRight: Radius.circular(50.r),
                  )
                : BorderRadius.only(
                    topRight: Radius.circular(50.r),
                    bottomLeft: Radius.circular(50.r),
                    bottomRight: Radius.circular(50.r),
                  ),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
              ),
            ),
            alignment: Alignment.bottomRight,
            child: UnconstrainedBox(
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: kPrimaryColor,
                  ),
                  child: itemFav
                      ? Image.asset("assets/Icons/Solidheart.png")
                      : Image.asset("assets/Icons/heart.png"),
                ),
              ),
            ),
          ),
        ),
        Gap(8.h),
        AppText(
          text: title,
          size: 16.sp,
          weight: FontWeight.w600,
        ),
        Gap(8.h),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: oldPrice,
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 1.h,
                  fontSize: 16.sp,
                  fontFamily: kFontFamily,
                  decoration: TextDecoration.lineThrough,
                  decorationStyle: TextDecorationStyle.solid,
                  decorationThickness: 2.h,
                ),
              ),
              TextSpan(
                text: "   $newPrice",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  letterSpacing: 1.h,
                  fontWeight: FontWeight.w700,
                  fontFamily: kFontFamily,
                  decorationStyle: TextDecorationStyle.solid,
                  decorationThickness: 2.h,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
