import '../../../../Core/Helper/constants.dart';
import '../../../../Core/Helper/extentions.dart';
import '../../../../Core/routing/routes.dart';
import '../../../../Models/cart_model.dart';
import '../../../../Models/item_model.dart';
import '../../../../Core/widgets/app_button.dart';
import '../../../../Core/widgets/app_text.dart';
import '../../../../Widgets/cart_image.dart';
import '../../../../Widgets/custom_floating_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  static String id = 'Cart';

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50.h),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const CustomFloatingAppBar(
                  title: "Cart", icon: Icons.arrow_back_ios_new_rounded),
            ),
            Gap(40.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      CartImage(
                        index: 0,
                        imagePath: cartData[0].image,
                        onTap: () {},
                        itemFav: itemsData[1].isFavourite,
                      )
                    ],
                  ),
                  Gap(16.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AppText(
                        text: cartData[0].title,
                        size: 16.sp,
                        weight: FontWeight.w700,
                      ),
                      Row(
                        children: [
                          AppText(
                            text: "Color : ",
                            size: 16.sp,
                            color: kSecondaryFontColor,
                          ),
                          Gap(4.w),
                          Container(
                            constraints:
                                BoxConstraints(minHeight: 15.h, minWidth: 20.w),
                            decoration: BoxDecoration(
                              color: cartData[0].color,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ],
                      ),
                      AppText(
                        text: "Size : ${cartData[0].size}",
                        size: 16.sp,
                        color: kSecondaryFontColor,
                      ),
                      Gap(8.h),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 8.w),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (cartData[0].quantity > 1) {
                                    cartData[0].quantity -= 1;
                                  }
                                });
                              },
                              child: Container(
                                constraints: BoxConstraints(
                                    minHeight: 35.h, minWidth: 35.w),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: kSecondaryFontColor, width: 2.w),
                                ),
                                child: const Icon(Icons.remove),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 8.w),
                            child: Container(
                              constraints: BoxConstraints(
                                  minHeight: 35.h, minWidth: 35.w),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.shade200),
                              child: Center(
                                child: AppText(
                                  text: cartData[0].quantity.toString(),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 8.w),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  cartData[0].quantity += 1;
                                });
                              },
                              child: Container(
                                constraints: BoxConstraints(
                                    minHeight: 35.h, minWidth: 35.w),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: kSecondaryFontColor, width: 2.w),
                                ),
                                child: const Icon(Icons.add),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(8.h),
                      AppText(
                        text:
                            "\$${(cartData[0].price * cartData[0].quantity).toString()}",
                        weight: FontWeight.w700,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Row(
                children: <Widget>[
                  AppText(
                    text: "Total Amount : ",
                    size: 24.sp,
                    weight: FontWeight.w700,
                  ),
                  const Spacer(),
                  AppText(
                    text:
                        "\$${(cartData[0].price * cartData[0].quantity).toString()}",
                    size: 24.sp,
                    weight: FontWeight.w700,
                  ),
                ],
              ),
            ),
            AppButton(
              text: "CHECK OUT",
              onTap: () {
                context.pushNamed(Routes.paymentMethodsView);
              },
            )
          ],
        ),
      ),
    );
  }
}
