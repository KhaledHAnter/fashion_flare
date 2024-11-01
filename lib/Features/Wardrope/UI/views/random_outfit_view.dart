import 'dart:io';

import 'package:fashion_flare/Core/widgets/app_text.dart';
import 'package:fashion_flare/Core/widgets/custom_floating_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RandomOutfitView extends StatelessWidget {
  final List<File>? images;
  const RandomOutfitView({
    super.key,
    this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: const CustomFloatingAppBar(
                title: "Random Outfit",
                icon: Icons.arrow_back_ios_new_rounded,
              ),
            ),
            const AppText(
              text: "This is random outfit from your wardrobe",
              size: 16,
              weight: FontWeight.w500,
            ),
            Expanded(
              child: Column(
                children: List.generate(
                  images!.length,
                  (index) {
                    return Expanded(
                      child: Container(
                        padding: EdgeInsets.all(16.r),
                        child: Image.file(images![index]),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
