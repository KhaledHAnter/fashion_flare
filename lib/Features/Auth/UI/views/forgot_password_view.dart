import '../../../../Core/Helper/validator_utils/validator_utils.dart';
import '../manager/forgot_pass_cubit/forgot_pass_cubit.dart';
import '../widgets/forgot_pass_bloc_listener.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Core/Helper/constants.dart';
import '../../../../Core/widgets/app_text.dart';
import '../../../../Core/widgets/app_text_form_field.dart';
import '../../../../Core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgotPassCubit>();
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
                key: cubit.formKey,
                autovalidateMode: cubit.autovalidateMode,
                child: AppTextFormField(
                  validator: ValidatorUtils.validateEmail,
                  controller: cubit.emailController,
                  keyboardType: TextInputType.emailAddress,
                  labelText: "Email Address",
                  prefixIcon: FontAwesomeIcons.solidEnvelope,
                  obscureText: false,
                ),
              ),
              Gap(45.h),
              CustomButton(
                text: "Continue",
                onTap: () async {
                  cubit.sendPasswordResetEmail();
                },
              ),
              const ForgotPassBlocListener(),
            ],
          ),
        ),
      ),
    );
  }
}
