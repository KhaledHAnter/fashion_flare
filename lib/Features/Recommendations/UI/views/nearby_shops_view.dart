import '../../../../Core/Helper/constants.dart';
import '../../../../Core/widgets/app_button.dart';
import '../../../../Core/widgets/app_text.dart';
import '../../../../Core/widgets/custom_floating_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class NearbyShops extends StatelessWidget {
  const NearbyShops({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Images/Map.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 50.h),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: const CustomFloatingAppBar(
                  title: "NEARBY SHOPS",
                  icon: Icons.arrow_back_ios_rounded,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    showDragHandle: true,
                    context: context,
                    builder: (context) {
                      return Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  height: 74.h,
                                  width: 114.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Image.asset(
                                    "assets/Images/LC 1.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Container(
                                  height: 74.h,
                                  width: 114.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Image.asset(
                                    "assets/Images/LC 2.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Container(
                                  height: 74.h,
                                  width: 114.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Image.asset(
                                    "assets/Images/LC 3.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ],
                            ),
                            Gap(16.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Row(
                                children: <Widget>[
                                  const AppText(text: "LC WAIKIKI"),
                                  const Spacer(),
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  AppText(
                                    text: "4.5 Stars",
                                    color: kSecondaryFontColor,
                                    size: 16.sp,
                                  ),
                                ],
                              ),
                            ),
                            Gap(10.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: AppText(
                                text:
                                    "Tarshouby tower, suez canal, streer, ElMansoura, Dakahlia Governorate 7661311, Egypt",
                                color: const Color(0xff4A4A68),
                                size: 16.sp,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Gap(30.h),
                            // const AppButton(text: "DIRECTIONS"),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  height: 122.h,
                  width: 122.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      center: Alignment.center,
                      colors: [
                        Colors.white,
                        kPrimaryColor,
                        kPrimaryColor.withOpacity(.6),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
