import '../../../../Core/widgets/app_text.dart';
import 'product_image.dart';
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
  final String imagePath, title;
  final bool itemFav, wishlist;
  final int index;
  final num price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: ProductImage(
            index: index,
            imagePath: imagePath,
            onTap: onTap,
            itemFav: itemFav,
            wishlist: wishlist,
          ),
        ),
        Gap(8.h),
        Expanded(
          flex: 2,
          child: Column(children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: AppText(
                text: title,
                size: 16.sp,
                weight: FontWeight.w600,
              ),
            ),
            Gap(8.h),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: AppText(
                text: "\$ $price",
                size: 18.sp,
                weight: FontWeight.w700,
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
