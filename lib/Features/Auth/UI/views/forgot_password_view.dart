import 'package:fashion_flare/Core/Helper/auth_services/auth_services.dart';
import 'package:fashion_flare/Core/Helper/show_snackbar.dart';
import 'package:fashion_flare/Core/Helper/validator_utils/validator_utils.dart';

import '../../../../Core/Helper/constants.dart';
import '../../../../Core/Helper/extentions.dart';
import '../../../../Core/routing/routes.dart';
import '../../../../Core/widgets/app_text.dart';
import '../../../../Core/widgets/app_text_form_field.dart';
import '../../../../Core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String? email;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool autoValidate = false;
  final AuthServices _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AppText(
                text: "Forgot Password?",
                size: 30.sp,
                weight: FontWeight.w700,
              ),
              Gap(8.h),
              AppText(
                text:
                    "Don't worry ! It happens. Please enter the email address we will send reset email to reset your password?",
                size: 16.sp,
                weight: FontWeight.w500,
                color: kSecondaryFontColor,
              ),
              Gap(40.h),
              Form(
                key: formKey,
                child: AppTextFormField(
                  autoValidate: autoValidate,
                  validator: ValidatorUtils.validateEmail,
                  onChanged: (value) {
                    setState(() {});
                    email = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  labelText: "Email Address",
                  prefixIcon: FontAwesomeIcons.solidEnvelope,
                  obscureText: false,
                ),
              ),
              Gap(45.h),
              CustomButton(
                text: "Continue",
                color: email == null
                    ? kSecondaryFontColor.withOpacity(0.5)
                    : kPrimaryColor,
                onTap: () async {
                  if (!(email == null || email!.isEmpty) &&
                      formKey.currentState!.validate()) {
                    try {
                      await _auth.resetPassword(email!);
                      showSnackbar(
                          context,
                          "Password reset email sent, check your inbox",
                          Colors.green);
                      context.pushNamedAndRemoveUntil(Routes.signInView,
                          predicate: (Route<dynamic> route) => false);
                    } on Exception catch (e) {
                      showSnackbar(context, e.toString(), Colors.red);
                    }
                  } else {
                    setState(() {
                      autoValidate = true;
                    });
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
