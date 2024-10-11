import 'package:fashion_flare/Features/Auth/UI/views/user_credentials_view.dart';
import 'package:fashion_flare/Widgets/app_text.dart';
import 'package:fashion_flare/Widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  static String id = "Profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: GestureDetector(
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
                                  Navigator.pop(context);
                                },
                              )),
                              Gap(16.w),
                              Expanded(
                                child: CustomButton(
                                  text: "Log Out",
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, UserCredentialsView.id);
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
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/Images/prof2.png",
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
