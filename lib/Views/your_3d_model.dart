import 'package:fashion_flare/Widgets/app_button.dart';
import 'package:fashion_flare/Widgets/app_text.dart';
import 'package:fashion_flare/Widgets/image_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class Your3DModel extends StatelessWidget {
  const Your3DModel({super.key});

  static String id = 'Your 3d Model';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                AppText(
                  text: "Your 3D Model",
                  size: 40.sp,
                  weight: FontWeight.w700,
                ),
                Gap(8.h),
                AppText(
                  text:
                      "Here's your 3D model where you'll see your selected items come to life.",
                  size: 16.sp,
                ),
              ],
            ),
          ),
          const Expanded(
            flex: 10,
            child: ImageContainer(imagePath: "assets/Images/4.png"),
          ),
          const Expanded(
            flex: 1,
            child: AppButton(text: "Continue"),
          )
        ],
      ),
    );
  }
}
