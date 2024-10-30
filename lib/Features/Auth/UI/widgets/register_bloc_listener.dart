import 'package:fashion_flare/Core/Helper/constants.dart';
import 'package:fashion_flare/Core/Helper/extentions.dart';
import 'package:fashion_flare/Core/Helper/show_snackbar.dart';
import 'package:fashion_flare/Core/routing/routes.dart';
import 'package:fashion_flare/Features/Auth/UI/manager/register_cubit/register_cubit.dart';
import 'package:fashion_flare/Features/Auth/UI/manager/register_cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class RegisterBlocListener extends StatelessWidget {
  const RegisterBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen: (previous, current) =>
          current is Loading ||
          current is EmailSuccess ||
          current is EmailError ||
          current is GoogleSuccess ||
          current is GoogleNotRegistered ||
          current is GoogleError,
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
          googleSuccess: () {
            context.pop();
            context.pushNamedAndRemoveUntil(Routes.navHomeView,
                predicate: (Route<dynamic> route) => false);
          },
          googleError: () {
            context.pop();
            showSnackbar(context, "Google sign in cancelled", Colors.red);
          },
          googleNotRegistered: () {
            context.pop();
            context.pushNamedAndRemoveUntil(Routes.userDetails,
                predicate: (Route<dynamic> route) => false);
          },
          emailSuccess: () {
            context.pop();
            context.pushNamedAndRemoveUntil(Routes.userDetails,
                predicate: (Route<dynamic> route) => false);
          },
          emailError: (errMsg) {
            context.pop();
            showSnackbar(context, errMsg, Colors.red);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
