import '../../../../Core/Helper/constants.dart';
import '../../../../Core/Helper/extentions.dart';
import '../../../../Core/routing/routes.dart';
import '../../../../Models/style.dart';
import '../../../../Core/widgets/app_text.dart';
import '../../../../Core/widgets/custom_button.dart';
import '../../../../Widgets/style_choose_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ChooseStyleView extends StatefulWidget {
  const ChooseStyleView({super.key});

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
                    context.pushNamed(Routes.chooseHairView);
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
