import 'package:fashion_flare/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.index,
    required this.imagePath,
    required this.onTap,
    required this.itemFav,
    this.wishlist = false,
  });

  final int index;
  final String imagePath;
  final void Function()? onTap;
  final bool itemFav, wishlist;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              child: wishlist
                  ? const Icon(Icons.close)
                  : itemFav
                      ? Image.asset("assets/Icons/Solidheart.png")
                      : Image.asset("assets/Icons/heart.png"),
            ),
          ),
        ),
      ),
    );
  }
}
