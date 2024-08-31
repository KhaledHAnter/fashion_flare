import 'package:fashion_flare/Models/shipping_model.dart';
import 'package:fashion_flare/Views/recept_view.dart';
import 'package:fashion_flare/Widgets/app_button.dart';
import 'package:fashion_flare/Widgets/app_text.dart';
import 'package:fashion_flare/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class PaymentDoneView extends StatelessWidget {
  const PaymentDoneView({super.key});

  static String id = 'Payment Done';

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> Data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          const Spacer(),
          Container(
            padding: EdgeInsets.all(10.r),
            constraints: BoxConstraints(minHeight: 214.h, minWidth: 214.w),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: kPrimaryColor,
            ),
            child: const FittedBox(child: Icon(Icons.check)),
          ),
          Gap(40.h),
          AppText(
            text: "PAYMENT\nSUCCESSFUL",
            color: Colors.white,
            size: 40.sp,
            weight: FontWeight.w700,
          ),
          const Spacer(),
          AppButton(
            text: "VIEW RECEPT",
            onTap: () {
              Navigator.pushNamed(context, ReceptView.id, arguments: Data);
            },
          )
        ],
      ),
    );
  }
}
