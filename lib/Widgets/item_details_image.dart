import 'package:fashion_flare/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemDetailsImage extends StatelessWidget {
  const ItemDetailsImage({
    super.key,
    required this.imagePath,
    required this.itemFav,
    this.onTap,
  });

  final void Function()? onTap;
  final String imagePath;
  final bool itemFav;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          constraints: BoxConstraints(minHeight: 300.h),
          decoration: BoxDecoration(
            color: const Color(0XFFECF1F4),
            borderRadius: BorderRadius.circular(50),
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
                  width: 50.w,
                  height: 50.h,
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
      ],
    );
  }
}
