import 'package:fashion_flare/Widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.screenNum,
    this.onTap,
  });
  final String image, title, description;
  final num screenNum;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: onTap,
                child: Visibility(
                  visible: screenNum == 3 ? false : true,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      AppText(
                        text: "Skip",
                        size: 18.sp,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              AppText(
                text: title,
                size: 40.sp,
                weight: FontWeight.w700,
              ),
              Gap(12.h),
              AppText(
                text: description,
                size: 14.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
