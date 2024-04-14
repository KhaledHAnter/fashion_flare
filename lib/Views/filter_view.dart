import 'package:fashion_flare/Models/filter_model.dart';
import 'package:fashion_flare/Widgets/app_text.dart';
import 'package:fashion_flare/Widgets/custom_floating_app_bar.dart';
import 'package:fashion_flare/Widgets/style_choose_card.dart';
import 'package:fashion_flare/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class FilterView extends StatefulWidget {
  const FilterView({super.key});

  static String id = 'Filter';

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  RangeValues values = const RangeValues(50, 1000);

  int CurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    RangeLabels labels = RangeLabels(
      values.start.toString(),
      values.end.toString(),
    );
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 60.h, right: 22.w, left: 22.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const CustomFloatingAppBar(
              icon: Icons.arrow_back_ios_new_rounded,
              title: "FILTERS",
            ),
            Gap(40.h),
            AppText(
              text: "Price Range",
              size: 22.sp,
              weight: FontWeight.w700,
            ),
            Gap(12.h),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                AppText(
                  text: r"$50",
                ),
                AppText(
                  text: r"$1000",
                ),
              ],
            ),
            RangeSlider(
              values: values,
              onChanged: (newValue) {
                setState(() {
                  values = newValue;
                });
              },
              divisions: 100,
              labels: labels,
              activeColor: kPrimaryColor,
              inactiveColor: Colors.black,
              min: 50,
              max: 1000,
            ),
            Gap(20.h),
            ...List.generate(
              filterData.length - 1,
              (fIndex) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AppText(
                      text: filterData[fIndex].filterName,
                      weight: FontWeight.w700,
                    ),
                    Gap(16.h),
                    SizedBox(
                      height: 70.h,
                      width: double.infinity,
                      child: ListView.builder(
                          itemCount: filterData[fIndex].filterList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, sIndex) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  CurrentIndex = sIndex;
                                });
                              },
                              child: StyleChooseCard(
                                color: CurrentIndex == sIndex
                                    ? kPrimaryColor.withOpacity(.7)
                                    : const Color(0XFFECF1F4),
                                title:
                                    filterData[fIndex].filterList[sIndex].name,
                              ),
                            );
                          }),
                    ),
                  ],
                );
              },
            ),
            ...List.generate(
              1,
              (fIndex) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AppText(
                      text: filterData[fIndex + 3].filterName,
                      weight: FontWeight.w700,
                    ),
                    Gap(16.h),
                    SizedBox(
                      height: 70.h,
                      width: double.infinity,
                      child: ListView.builder(
                          itemCount: filterData[fIndex + 3].filterList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, sIndex) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  CurrentIndex = sIndex;
                                });
                              },
                              child: StyleChooseCard(
                                color:
                                    filterData[fIndex + 3].filterList[sIndex],
                                title: '           ',
                              ),
                            );
                          }),
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
