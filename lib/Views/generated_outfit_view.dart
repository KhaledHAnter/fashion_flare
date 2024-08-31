import 'dart:developer';

import 'package:fashion_flare/Views/nav_home_view.dart';
import 'package:fashion_flare/Widgets/app_button.dart';
import 'package:fashion_flare/Widgets/custom_floating_app_bar.dart';
import 'package:fashion_flare/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class GeneratedOutfitView extends StatelessWidget {
  const GeneratedOutfitView({super.key});

  static String id = "Generated Outfit";

  @override
  Widget build(BuildContext context) {
    final List<String> Data =
        ModalRoute.of(context)!.settings.arguments as List<String>;
    log("assets/GLBs/${Data[0]}${Data[1]}${Data[2]}${Data[3]}.glb");
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50.h),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: CustomFloatingAppBar(
                title: "Outfit".toUpperCase(),
                icon: Icons.arrow_back_ios_new_rounded,
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Container(
                height: MediaQuery.of(context).size.height * .65,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: kTextFormFieldColor),
                child: ModelViewer(
                  src:
                      "assets/GLBs/${Data[0]}${Data[1]}${Data[2]}${Data[3]}.glb",
                  autoRotate: true,
                  ar: true,
                ),
              ),
            ),
            const Spacer(),
            AppButton(
                text: "Move To Home",
                onTap: () {
                  Navigator.pushNamed(context, NavHomeView.id);
                })
          ],
        ),
      ),
    );
  }
}
