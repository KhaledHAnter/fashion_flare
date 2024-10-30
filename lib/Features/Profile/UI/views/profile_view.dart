import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../Core/Helper/extentions.dart';
import '../../../../Core/routing/routes.dart';
import '../../../../Core/widgets/app_text.dart';
import '../../../../Core/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String userName = '';
  String userEmail = '';
  getUserData() async {
    DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .get();
    if (mounted) {
      setState(() {
        if (docSnapshot.exists) {
          userName = docSnapshot.get('name');
          userEmail = docSnapshot.get('email');
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    text: "Profile",
                    size: 26.sp,
                    weight: FontWeight.w700,
                  ),
                ],
              ),
              Gap(45.h),
              Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color(0XFFECF1F4),
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 30.r,
                          child: Image.asset(
                            "assets/Icons/profile.png",
                          ),
                        ),
                        Gap(6.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            AppText(
                              text: userName,
                              size: 16.sp,
                              weight: FontWeight.w500,
                            ),
                            Gap(4.h),
                            AppText(
                              text: userEmail,
                              size: 12.sp,
                              weight: FontWeight.w500,
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(FontAwesomeIcons.penToSquare),
                        )
                      ],
                    ),
                    Gap(25.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <AppText>[
                        AppText(
                          text: "ACCOUNT",
                          size: 14.sp,
                          weight: FontWeight.w500,
                        ),
                        AppText(
                          text: "PAYMENT",
                          size: 14.sp,
                          weight: FontWeight.w500,
                        ),
                        AppText(
                          text: "LOCATION",
                          size: 14.sp,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Gap(40.h),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SizedBox(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * .25,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: <Widget>[
                                AppText(
                                  text: "LOG OUT",
                                  size: 24.sp,
                                  weight: FontWeight.bold,
                                ),
                                Gap(16.h),
                                AppText(
                                  text: "Are you want to log out ?",
                                  size: 18.sp,
                                ),
                                const Spacer(),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                        child: CustomButton(
                                      text: "Cancel",
                                      color: Colors.grey.shade300,
                                      onTap: () {
                                        context.pop();
                                      },
                                    )),
                                    Gap(16.w),
                                    Expanded(
                                      child: CustomButton(
                                        text: "Log Out",
                                        onTap: () async {
                                          logout();
                                          context.pushNamedAndRemoveUntil(
                                              Routes.welcomeView,
                                              predicate: (context) => false);
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color(0XFFECF1F4),
                  ),
                  child: Row(children: <Widget>[
                    const Icon(
                      FontAwesomeIcons.powerOff,
                      color: Colors.black,
                    ),
                    Gap(8.w),
                    AppText(
                      text: "Log Out",
                      size: 16.sp,
                      weight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                    )
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> logout() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    if (await googleSignIn.isSignedIn()) await googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();
  }
}
