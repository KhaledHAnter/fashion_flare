import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../Auth/data/models/user_profile_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../Core/Helper/constants.dart';
import '../../../../Core/Helper/extentions.dart';
import '../../../../Core/routing/routes.dart';
import '../../data/models/user_details.dart';
import '../../../../Core/widgets/app_text.dart';
import '../../../../Core/widgets/app_text_form_field.dart';
import '../../../../Core/widgets/custom_button.dart';
import '../../../../Core/widgets/custom_drop_down_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  String? dropDownValue;
  String? name;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AppText(
                text: "User Details",
                size: 40.sp,
                weight: FontWeight.w700,
              ),
              Gap(8.h),
              AppText(
                text:
                    "Please fill in your details so we can match your model perfectly.",
                size: 16.h,
                color: kSecondaryFontColor,
              ),
              Gap(40.h),
              Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 10,
                  ),
                  child: Form(
                    key: formKey,
                    child: AppTextFormField(
                      onChanged: (p0) {
                        name = p0;
                      },
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return "Please enter your name";
                        }
                        return null;
                      },
                      labelText: "Name",
                      obscureText: false,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(2, (index) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 10,
                        ),
                        child: CustomDropDownButton(
                          hintText: userDetailsData[index].hintText,
                          value: userDetailsData[index].dropDownValue,
                          onChanged: (value) {
                            setState(() {
                              userDetailsData[index].dropDownValue =
                                  value.toString();
                            });
                          },
                          items:
                              userDetailsData[index].listItems.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    1,
                    (index) {
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical: 10,
                          ),
                          child: CustomDropDownButton(
                            hintText: userDetailsData[index + 2].hintText,
                            value: userDetailsData[index + 2].dropDownValue,
                            onChanged: (value) {
                              setState(() {
                                userDetailsData[index + 2].dropDownValue =
                                    value.toString();
                              });
                            },
                            items: userDetailsData[index + 2]
                                .listItems
                                .map((valueItem) {
                              return DropdownMenuItem(
                                value: valueItem,
                                child: Text(valueItem),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(2, (index) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 10),
                        child: CustomDropDownButton(
                          hintText: userDetailsData[index + 3].hintText,
                          value: userDetailsData[index + 3].dropDownValue,
                          onChanged: (value) {
                            setState(() {
                              userDetailsData[index + 3].dropDownValue =
                                  value.toString();
                            });
                          },
                          items: userDetailsData[index + 3]
                              .listItems
                              .map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  }),
                ),
              ]),
              Gap(40.h),
              CustomButton(
                text: "Continue",
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    UserProfileModel userProfile = getUserProfile();
                    await registerUser(userProfile);
                    // print(
                    //     "$name  ${userDetailsData[0].dropDownValue}  ${userDetailsData[1].dropDownValue}  ${userDetailsData[2].dropDownValue}  ${userDetailsData[3].dropDownValue}  ${userDetailsData[4].dropDownValue}");
                    context.pushNamed(Routes.chooseStyleView);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }

  UserProfileModel getUserProfile() {
    return UserProfileModel(
      name: name!,
      email: FirebaseAuth.instance.currentUser!.email!,
      gender: userDetailsData[0].dropDownValue ?? "Male",
      age: userDetailsData[1].dropDownValue ?? "22",
      city: userDetailsData[2].dropDownValue ?? "Cairo",
      height: userDetailsData[3].dropDownValue ?? "170 Cm",
      weight: userDetailsData[4].dropDownValue ?? "67 Kg",
    );
  }

  Future<void> registerUser(UserProfileModel userProfile) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userProfile.email)
        .set({
      'name': userProfile.name,
      'email': userProfile.email,
      'createdAt': FieldValue.serverTimestamp(),
      'gender': userProfile.gender,
      'city': userProfile.city,
      'age': userProfile.age,
      'height': userProfile.height,
      'weight': userProfile.weight
    });
  }
}
