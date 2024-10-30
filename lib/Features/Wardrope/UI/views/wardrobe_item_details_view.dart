import 'dart:io';
import '../../../../Core/widgets/app_text.dart';
import '../../../../Core/widgets/custom_floating_app_bar.dart';
import '../../data/models/wardrope_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class WardrobeItemDetailsView extends StatelessWidget {
  final WardrobeItemModel wardrobeItemModel;
  const WardrobeItemDetailsView({
    super.key,
    required this.wardrobeItemModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 60.h),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const CustomFloatingAppBar(
                title: "ITEM DETAILS",
                icon: Icons.arrow_back_ios_new_rounded,
              ),
            ),
            Gap(20.h),
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: WardrobeItemDetailsImage(
                  imagePath: wardrobeItemModel.image,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.transparent,
                child: Center(
                  child: AppText(
                      text: wardrobeItemModel.category,
                      size: 32,
                      weight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WardrobeItemDetailsImage extends StatelessWidget {
  const WardrobeItemDetailsImage({
    super.key,
    required this.imagePath,
  });

  final File imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      constraints: BoxConstraints(minHeight: 300.h),
      decoration: BoxDecoration(
        color: const Color(0XFFECF1F4),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          image: DecorationImage(
            image: Image.file(imagePath).image,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
