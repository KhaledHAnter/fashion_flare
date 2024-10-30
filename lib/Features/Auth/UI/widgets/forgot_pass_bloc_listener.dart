import 'package:fashion_flare/Core/Helper/constants.dart';
import 'package:fashion_flare/Core/Helper/extentions.dart';
import 'package:fashion_flare/Core/Helper/show_snackbar.dart';
import 'package:fashion_flare/Core/routing/routes.dart';
import 'package:fashion_flare/Features/Auth/UI/manager/forgot_pass_cubit/forgot_pass_cubit.dart';
import 'package:fashion_flare/Features/Auth/UI/manager/forgot_pass_cubit/forgot_pass_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ForgotPassBlocListener extends StatelessWidget {
  const ForgotPassBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPassCubit, ForgotPassState>(
      listenWhen: (previous, current) =>
          current is Loading || current is SentError || current is SentSuccess,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => Center(
                child: LoadingAnimationWidget.threeArchedCircle(
                    color: kPrimaryColor, size: 100),
              ),
            );
          },
          sentSuccess: () {
            context.pop();
            showSnackbar(context, "Password reset email sent, check your inbox",
                Colors.green);
            context.pushNamedAndRemoveUntil(Routes.signInView,
                predicate: (Route<dynamic> route) => false);
          },
          sentError: (errMsg) {
            context.pop();
            showSnackbar(context, errMsg, Colors.red);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
