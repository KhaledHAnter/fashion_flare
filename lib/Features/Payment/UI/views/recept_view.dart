import '../../../../Core/Helper/constants.dart';
import '../../../../Core/Helper/extentions.dart';
import '../../../../Core/routing/routes.dart';
import '../../data/models/shipping_model.dart';
import '../../../../Core/widgets/app_button.dart';
import '../../../../Core/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ReceptView extends StatelessWidget {
  final Map<String, dynamic> data;
  const ReceptView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    ShippingModel address = data['address'] as ShippingModel;
    int orderId = data['orederId'] as int;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Spacer(),
            Row(
              children: [
                const Spacer(),
                AppText(
                  text: "PURCHASE RECEIPT",
                  size: 32.sp,
                  weight: FontWeight.bold,
                ),
                const Spacer(),
              ],
            ),
            Gap(40.h),
            SizedBox(
              width: 180.w,
              child: AppText(
                text: "Thank you for your Purchase! ",
                size: 20.sp,
                weight: FontWeight.bold,
              ),
            ),
            Gap(16.h),
            Padding(
              padding: EdgeInsets.only(right: 50.w, left: 16.w),
              child: AppText(
                text:
                    "We’ve sent a confirmation to your email address, and we'll notify you about your order.",
                size: 16.sp,
                textAlign: TextAlign.start,
              ),
            ),
            Gap(16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                        text: "Shipment Address",
                        textAlign: TextAlign.start,
                        weight: FontWeight.bold,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: address.name,
                            textAlign: TextAlign.start,
                            size: 16.sp,
                            color: kSecondaryFontColor,
                          ),
                          AppText(
                            text: address.number,
                            textAlign: TextAlign.start,
                            size: 16.sp,
                            color: kSecondaryFontColor,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: AppText(
                              text: address.address,
                              textAlign: TextAlign.start,
                              size: 16.sp,
                              color: kSecondaryFontColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(
                    endIndent: 50,
                    indent: 50,
                  ),
                  Gap(8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const AppText(
                        text: "Order Number",
                        textAlign: TextAlign.start,
                        weight: FontWeight.bold,
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      AppText(
                        text: orderId.toString(),
                        textAlign: TextAlign.start,
                        size: 16.sp,
                        color: kSecondaryFontColor,
                      ),
                      const Spacer(),
                    ],
                  )
                ],
              ),
            ),
            const Spacer(),
            AppButton(
                text: "COUNTINUE SHOPPING",
                onTap: () {
                  context.pushNamed(Routes.navHomeView);
                }),
          ],
        ),
      ),
    );
  }
}
