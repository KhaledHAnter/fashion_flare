import 'package:fashion_flare/Models/user_details.dart';
import 'package:fashion_flare/Views/choose_style_view.dart';
import 'package:fashion_flare/Widgets/app_text.dart';
import 'package:fashion_flare/Widgets/app_text_form_field.dart';
import 'package:fashion_flare/Widgets/custom_button.dart';
import 'package:fashion_flare/Widgets/custom_drop_down_button.dart';
import 'package:fashion_flare/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  static String id = 'Home Page';

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
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    print(
                        "$name  ${userDetailsData[0].dropDownValue}  ${userDetailsData[1].dropDownValue}  ${userDetailsData[2].dropDownValue}  ${userDetailsData[3].dropDownValue}  ${userDetailsData[4].dropDownValue}");
                    Navigator.pushNamed(context, ChooseStyleView.id);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
