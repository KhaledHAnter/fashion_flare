import 'dart:math';

import '../../../../Core/Helper/constants.dart';
import '../../../../Core/Helper/extentions.dart';
import '../../../../Core/routing/routes.dart';
import '../../../Cart/data/models/cart_model.dart';
import '../../data/models/shipping_model.dart';
import '../../../../Core/Services/FireBase Services/firebase_services.dart';
import '../../../../Core/widgets/app_button.dart';
import '../../../../Core/widgets/app_text.dart';
import '../../../../Core/widgets/custom_floating_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class Checkoutview extends StatefulWidget {
  const Checkoutview({super.key});

  @override
  State<Checkoutview> createState() => _CheckoutviewState();
}

class _CheckoutviewState extends State<Checkoutview> {
  final int delivery = 15;

  int _shippingIndex = 0;

  List<ShippingModel> _addresses = [];

  Future<void> _loadAddresses() async {
    List<ShippingModel> addresses = await getAddresses();
    setState(() {
      _addresses = addresses;
    });
    print(addresses);
  }

  @override
  void initState() {
    _loadAddresses();
    clearAddress();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  int generateRandomOrderId() {
    final Random random = Random();
    int orderId = 10000 +
        random.nextInt(90000); // Generates a number between 10000 and 99999
    return orderId;
  }

  @override
  Widget build(BuildContext context) {
    int orderId = generateRandomOrderId();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              child: const CustomFloatingAppBar(
                  title: "Checkout", icon: Icons.arrow_back_ios_new_rounded),
            ),
            Gap(40.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: AppText(
                text: "SHIPPING ADDRESS",
                size: 18.sp,
              ),
            ),
            SizedBox(
              height: 250.h,
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    _addresses.length,
                    (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _shippingIndex = index;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 16.h),
                          margin: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 8.h),
                          constraints: BoxConstraints(minHeight: 100.h),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: _shippingIndex == index
                                  ? kPrimaryColor.withOpacity(.3)
                                  : kTextFormFieldColor),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  AppText(
                                    text: _addresses[index].name,
                                    size: 18.sp,
                                    weight: FontWeight.w700,
                                    color: const Color(0xff4A4A68),
                                  ),
                                  const Icon(
                                    FontAwesomeIcons.ellipsisVertical,
                                    color: Color(0xff4A4A68),
                                  ),
                                ],
                              ),
                              AppText(
                                text: _addresses[index].address,
                                textAlign: TextAlign.start,
                                color: kSecondaryFontColor,
                                size: 16.sp,
                              ),
                              AppText(
                                text: _addresses[index].number,
                                textAlign: TextAlign.start,
                                color: const Color(0xff4A4A68),
                                size: 16.sp,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Gap(40.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: AppText(
                text: "PAYMENT",
                size: 18.sp,
              ),
            ),
            Gap(20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: kTextFormFieldColor,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    constraints:
                        BoxConstraints(minHeight: 48.h, minWidth: 70.w),
                    child: Image.asset("assets/Icons/Mastercard.png"),
                  ),
                  Gap(16.w),
                  const AppText(text: "**** **** **** 1234"),
                ],
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      AppText(
                        text: "Order".toUpperCase(),
                        color: Colors.white,
                        size: 18.sp,
                      ),
                      AppText(
                        text: "${(cartData[0].price).toString()} \$",
                        color: Colors.white,
                        size: 18.sp,
                      ),
                    ],
                  ),
                  Gap(16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      AppText(
                        text: "Delivery".toUpperCase(),
                        color: Colors.white,
                        size: 18.sp,
                      ),
                      AppText(
                        text: "${delivery.toString()} \$",
                        color: Colors.white,
                        size: 18.sp,
                      ),
                    ],
                  ),
                  Gap(16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      AppText(
                        text: "Summary".toUpperCase(),
                        color: kPrimaryColor,
                        size: 18.sp,
                      ),
                      AppText(
                        text: "${(cartData[0].price) + delivery} \$",
                        color: kPrimaryColor,
                        size: 18.sp,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Gap(16.h),
            AppButton(
                text: "Confirm Order".toUpperCase(),
                onTap: () {
                  addToOrder(
                    price: (cartData[0].price),
                    orderId: orderId,
                  );
                  context.pushNamed(Routes.paymentDoneView, arguments: {
                    "address": _addresses[_shippingIndex],
                    "orederId": orderId
                  });
                }),
          ],
        ),
      ),
    );
  }
}
