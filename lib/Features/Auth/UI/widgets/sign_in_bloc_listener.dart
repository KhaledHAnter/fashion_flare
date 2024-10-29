import 'package:fashion_flare/Core/Helper/extentions.dart';
import 'package:fashion_flare/Core/routing/routes.dart';
import 'package:fashion_flare/Features/Auth/UI/manager/cubit/signin_cubit.dart';
import 'package:fashion_flare/Features/Auth/UI/manager/cubit/signin_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SignInBlocListener extends StatelessWidget {
  const SignInBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SigninCubit, SigninState>(
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
                    color: Colors.redAccent, size: 100),
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
          },
          googleNotRegistered: () {
            context.pop();
            context.pushNamedAndRemoveUntil(Routes.userDetails,
                predicate: (Route<dynamic> route) => false);
          },
          emailSuccess: () {
            context.pop();
            print("email success");
          },
          emailError: (errMsg) {
            context.pop();
            print("email error $errMsg");
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
