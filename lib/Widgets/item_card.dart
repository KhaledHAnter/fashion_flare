import 'package:fashion_flare/Widgets/app_text.dart';
import 'package:fashion_flare/Widgets/product_image.dart';
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
    this.wishlist = false,
  });

  final void Function()? onTap;
  final String imagePath, title, price;
  final bool itemFav, wishlist;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductImage(
          index: index,
          imagePath: imagePath,
          onTap: onTap,
          itemFav: itemFav,
          wishlist: wishlist,
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
