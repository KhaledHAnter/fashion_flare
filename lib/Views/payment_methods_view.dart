import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_flare/Models/payment_model.dart';
import 'package:fashion_flare/Services/FireBase%20Services/firebase_services.dart';
import 'package:fashion_flare/Views/checkout_view.dart';
import 'package:fashion_flare/Widgets/app_button.dart';
import 'package:fashion_flare/Widgets/app_text.dart';
import 'package:fashion_flare/Widgets/custom_floating_app_bar.dart';
import 'package:fashion_flare/Widgets/visa_card_image.dart';
import 'package:fashion_flare/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class PaymenMethods extends StatefulWidget {
  const PaymenMethods({super.key});

  static String id = " Payment Methods";

  @override
  State<PaymenMethods> createState() => _PaymenMethodsState();
}

class _PaymenMethodsState extends State<PaymenMethods> {
  List<PaymentModel> _payments = [];

  Future<void> _loadPayments() async {
    List<PaymentModel> payments = await getPayment();
    setState(() {
      _payments = payments;
    });
    print(_payments);
  }

  bool isChecked = true;
  bool isChecked2 = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool autovalidate = false;
  String? cardNum, expMounth, expYear, CVV, cardName;

  @override
  void initState() {
    // getPaymentData();
    _loadPayments();
    clearPayment();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const CustomFloatingAppBar(
                title: "Payment Methods",
                icon: Icons.arrow_back_ios_new_rounded,
              ),
            ),
            Gap(40.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: AppText(
                text: "YOUR PAYMENT CARDS",
                size: 18.sp,
              ),
            ),
            const Divider(
              endIndent: 50,
              indent: 50,
            ),
            Gap(8.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 24.h,
                              ),
                              child: Column(
                                children: <Widget>[
                                  AppText(
                                    text: "Add New Card".toUpperCase(),
                                    weight: FontWeight.bold,
                                    size: 24.sp,
                                  ),
                                  Gap(20.h),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.h),
                                    child: Form(
                                      autovalidateMode: autovalidate
                                          ? AutovalidateMode.onUserInteraction
                                          : AutovalidateMode.disabled,
                                      key: formKey,
                                      child: Column(
                                        children: <Widget>[
                                          TextFormField(
                                            keyboardType: TextInputType.name,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "Please Enter Name";
                                              }
                                              return null;
                                            },
                                            onChanged: (value) {
                                              cardName = value;
                                            },
                                            style: TextStyle(
                                              fontSize: 20.sp,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            decoration: InputDecoration(
                                              labelText:
                                                  "Name on Card".toUpperCase(),
                                              labelStyle:
                                                  TextStyle(fontSize: 18.sp),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                              ),
                                            ),
                                          ),
                                          Gap(16.h),
                                          TextFormField(
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "Please Enter Card Number";
                                              } else if (value.length != 16) {
                                                return "Invalid Card Number";
                                              }
                                              return null;
                                            },
                                            onChanged: (value) {
                                              cardNum = value;
                                            },
                                            style: TextStyle(
                                              fontSize: 20.sp,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              labelText:
                                                  "CARD NUMBER".toUpperCase(),
                                              labelStyle:
                                                  TextStyle(fontSize: 18.sp),
                                              suffix: Image.asset(
                                                "assets/Icons/Mastercard.png",
                                                height: 20.h,
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                              ),
                                            ),
                                          ),
                                          Gap(16.h),
                                          Row(
                                            children: <Widget>[
                                              Expanded(
                                                flex: 1,
                                                child: TextFormField(
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return "Please Enter Date";
                                                    }
                                                    return null;
                                                  },
                                                  onChanged: (value) {
                                                    expMounth = value;
                                                  },
                                                  keyboardType:
                                                      TextInputType.number,
                                                  style: TextStyle(
                                                    fontSize: 20.sp,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  decoration: InputDecoration(
                                                    labelText: "M",
                                                    labelStyle: TextStyle(
                                                        fontSize: 18.sp),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Gap(4.w),
                                              const AppText(
                                                text: " / ",
                                                weight: FontWeight.bold,
                                              ),
                                              Gap(4.w),
                                              Expanded(
                                                flex: 1,
                                                child: TextFormField(
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return "Please Enter Date";
                                                    }
                                                    return null;
                                                  },
                                                  onChanged: (value) {
                                                    expYear = value;
                                                  },
                                                  keyboardType:
                                                      TextInputType.number,
                                                  style: TextStyle(
                                                    fontSize: 20.sp,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  decoration: InputDecoration(
                                                    labelText: "Y",
                                                    labelStyle: TextStyle(
                                                        fontSize: 18.sp),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Gap(4.w),
                                              Expanded(
                                                flex: 2,
                                                child: TextFormField(
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return "Please Enter CVV";
                                                    }
                                                    return null;
                                                  },
                                                  onChanged: (value) {
                                                    CVV = value;
                                                  },
                                                  keyboardType:
                                                      TextInputType.number,
                                                  style: TextStyle(
                                                    fontSize: 20.sp,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  decoration: InputDecoration(
                                                    labelText: "CVV",
                                                    labelStyle: TextStyle(
                                                        fontSize: 18.sp),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Gap(24.h),
                                          Row(
                                            children: <Widget>[
                                              Checkbox(
                                                value: isChecked2,
                                                onChanged: (onChanged) {
                                                  setState(() {
                                                    isChecked2 = !isChecked2;
                                                  });
                                                },
                                              ),
                                              AppText(
                                                text:
                                                    "Agree to Terms & Conditions",
                                                size: 16.sp,
                                                color: kSecondaryFontColor,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  AppButton(
                                    text: "Add Card".toUpperCase(),
                                    onTap: () {
                                      if (formKey.currentState!.validate()) {
                                        addToPayment(
                                            cardNum: int.parse(cardNum!),
                                            cardName: cardName!,
                                            CVV: CVV!,
                                            expMonth: expMounth!,
                                            expYear: expYear!);
                                        Navigator.pop(context);
                                      } else {
                                        setState(() {
                                          autovalidate = true;
                                        });
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Row(
                      children: <Widget>[
                        Container(
                          constraints:
                              BoxConstraints(minHeight: 50.h, minWidth: 50.w),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.add,
                            size: 35,
                          ),
                        ),
                        Gap(16.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const AppText(
                              text: "Add a new card",
                              weight: FontWeight.bold,
                            ),
                            AppText(
                              text: "Get another card for checkout",
                              size: 16.sp,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Gap(16.h),
                  SizedBox(
                    height: 200.h,
                    width: double.infinity,
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: _payments.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: <Widget>[
                              Container(
                                constraints: BoxConstraints(
                                    minHeight: 75.h, minWidth: 75.w),
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/Images/visa.png"))),
                              ),
                              Gap(16.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  AppText(
                                    text:
                                        "Digital Card •••• ${_payments[index].cardNum % 10000}",
                                    weight: FontWeight.bold,
                                  ),
                                  const AppText(
                                    text: "Ready to use",
                                    color: kSecondaryFontColor,
                                  ),
                                ],
                              )
                            ],
                          );
                        }),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Row(
                children: <Widget>[
                  Checkbox(
                      value: isChecked,
                      onChanged: (onChanged) {
                        setState(() {
                          isChecked = !isChecked;
                        });
                      }),
                  AppText(
                    text: "Set as a default payment",
                    size: 14.h,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 4.h),
              width: double.infinity,
              constraints: BoxConstraints(minHeight: 64.h),
              decoration: BoxDecoration(
                color: const Color(0xffECF1F4),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(children: <Widget>[
                Image.asset("assets/Icons/Visa.png"),
                Gap(16.w),
                const AppText(
                  text: "PayPal",
                ),
              ]),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 4.h),
              width: double.infinity,
              constraints: BoxConstraints(minHeight: 64.h),
              decoration: BoxDecoration(
                color: const Color(0xffECF1F4),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(children: <Widget>[
                Image.asset("assets/Icons/GooglePay.png"),
                Gap(16.w),
                const AppText(
                  text: "Google Pay",
                ),
              ]),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 4.h),
              width: double.infinity,
              constraints: BoxConstraints(minHeight: 64.h),
              decoration: BoxDecoration(
                color: const Color(0xffECF1F4),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(children: <Widget>[
                Image.asset("assets/Icons/Mastercard.png"),
                Gap(16.w),
                const AppText(
                  text: "Others",
                ),
              ]),
            ),
            const Spacer(),
            AppButton(
              text: "CONFIRM PAYMENT",
              onTap: () {
                Navigator.pushNamed(context, Checkoutview.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
