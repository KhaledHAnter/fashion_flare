import '../../../../Core/Helper/constants.dart';
import '../../../../Core/Helper/extentions.dart';
import '../../../../Core/routing/routes.dart';
import '../../../../Core/widgets/app_button.dart';
import '../../../../Core/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class PaymentDoneView extends StatelessWidget {
  final Map<String, dynamic> data;
  const PaymentDoneView({super.key, required this.data});

  static String id = 'Payment Done';

  @override
  Widget build(BuildContext context) {
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
              context.pushNamed(Routes.receptView, arguments: data);
            },
          )
        ],
      ),
    );
  }
}
