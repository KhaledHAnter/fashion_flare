import 'package:fashion_flare/Models/item_model.dart';
import 'package:fashion_flare/Widgets/app_text.dart';
import 'package:fashion_flare/Widgets/info_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class InfoBottomSheetContent extends StatelessWidget {
  const InfoBottomSheetContent({
    super.key,
    required this.args,
  });

  final itemModel args;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          AppText(
            text: "INFORMATION",
            size: 26.sp,
            weight: FontWeight.w700,
          ),
          Gap(12.h),
          InfoRow(title: "Main Fabric", subtitle: "${args.mainfabric}"),
          Gap(4.h),
          InfoRow(title: "Pattern", subtitle: "${args.pattern}"),
          Gap(4.h),
          InfoRow(title: "Fit", subtitle: "${args.fit}"),
          Gap(4.h),
          InfoRow(title: "Thickness", subtitle: "${args.thickness}"),
          Gap(4.h),
          InfoRow(title: "Sleeve Length", subtitle: "${args.sleevelength}"),
          Gap(4.h),
          InfoRow(title: "Product Type", subtitle: "${args.prducttype}"),
          Gap(4.h),
          InfoRow(title: "Ocassion", subtitle: "${args.ocassion}"),
          Gap(4.h),
          InfoRow(title: "Season", subtitle: "${args.season}"),
          Gap(4.h),
          InfoRow(title: "Gender", subtitle: "${args.gender}"),
          Gap(4.h),
        ],
      ),
    );
  }
}
