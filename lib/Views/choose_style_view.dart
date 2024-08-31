import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_flare/Models/style.dart';
import 'package:fashion_flare/Views/choose_hair_view.dart';
import 'package:fashion_flare/Views/your_3d_model.dart';
import 'package:fashion_flare/Widgets/app_text.dart';
import 'package:fashion_flare/Widgets/custom_button.dart';
import 'package:fashion_flare/Widgets/style_choose_card.dart';
import 'package:fashion_flare/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ChooseStyleView extends StatefulWidget {
  const ChooseStyleView({super.key});

  static String id = 'Choose Style';

  @override
  State<ChooseStyleView> createState() => _ChooseStyleViewState();
}

class _ChooseStyleViewState extends State<ChooseStyleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppText(
                    text: "Choose Style", size: 40.sp, weight: FontWeight.w700),
                Gap(8.h),
                AppText(
                  text:
                      "Select your preferred style so we can recommend the best outfits for you.",
                  size: 16.sp,
                  color: kSecondaryFontColor,
                ),
                Gap(40.h),
                Wrap(
                  children: List.generate(styleData.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          styleData[index].isSelected =
                              !styleData[index].isSelected;
                        });
                      },
                      child: StyleChooseCard(
                        title: styleData[index].name,
                        color: styleData[index].isSelected
                            ? kPrimaryColor.withOpacity(.7)
                            : const Color(0XFFECF1F4),
                      ),
                    );
                  }),
                ),
                Gap(40.h),
                CustomButton(
                  text: "Continue",
                  onTap: () {
                    Navigator.pushNamed(context, ChooseHairView.id);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
