import 'package:fashion_flare/Widgets/app_text.dart';
import 'package:fashion_flare/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    this.onTap,
    required this.imagePath,
    required this.itemFav,
    required this.title,
    required this.price,
    required this.index,
  });

  final void Function()? onTap;
  final String imagePath, title, price;
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
        AppText(
          text: price,
          size: 18.sp,
          weight: FontWeight.w700,
        ),
      ],
    );
  }
}
