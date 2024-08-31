import 'package:fashion_flare/Widgets/app_button.dart';
import 'package:fashion_flare/Widgets/custom_floating_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodayOutfitView extends StatelessWidget {
  const TodayOutfitView({super.key});

  static String id = 'Today Outfit';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50.h),
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: CustomFloatingAppBar(
                title: "Today's Outfit",
                icon: Icons.arrow_back_ios_new_rounded,
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/Images/today outfit.png")),
                ),
              ),
            ),
            const AppButton(text: "SEE ITEMS")
          ],
        ),
      ),
    );
  }
}
