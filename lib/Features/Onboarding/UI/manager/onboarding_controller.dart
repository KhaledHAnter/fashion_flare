import 'package:fashion_flare/Core/Helper/extentions.dart';
import 'package:flutter/material.dart';
import '../../../../Core/routing/routes.dart';
import '../../Data/Models/onboard.dart';

class OnBoardingController {
  final PageController pageController = PageController(initialPage: 0);
  int pageIndex = 0;

  /// Handle page change
  void onPageChanged(int value) {
    pageIndex = value;
  }

  /// Navigate based on the current page index
  void onBoardingButtonAction(BuildContext context) {
    if (pageIndex == OnBoardData.length - 1) {
      context.pushReplacementNamed(Routes.userCredentialsView);
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeIn,
      );
    }
  }

  /// Handle dot indicator tap to change the page
  void onDotIndicatorTap(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeIn,
    );
  }

  /// Dispose of the page controller
  void dispose() {
    pageController.dispose();
  }
}
