import 'package:fashion_flare/Core/Helper/extentions.dart';
import 'package:fashion_flare/Core/routing/routes.dart';
import 'package:fashion_flare/Features/Onboarding/UI/manager/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/widgets/app_button.dart';
import '../widgets/dot_indicator.dart';
import '../widgets/onboarding_content.dart';
import '../../Data/Models/onboard.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late OnBoardingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = OnBoardingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: <Widget>[
            _buildPageView(),
            _buildDotIndicators(),
            _buildActionButton(),
          ],
        ),
      ),
    );
  }

  /// Builds the PageView that shows the onboarding content.
  Widget _buildPageView() {
    return Expanded(
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: OnBoardData.length,
        controller: _controller.pageController,
        onPageChanged: (value) => setState(() {
          _controller.onPageChanged(
            value,
          );
        }),
        itemBuilder: (context, index) {
          return OnBoardingContent(
            image: OnBoardData[index].image,
            title: OnBoardData[index].title,
            description: OnBoardData[index].description,
            screenNum: index + 1,
            onTap: () {
              context.pushReplacementNamed(Routes.userCredentialsView);
            },
          );
        },
      ),
    );
  }

  /// Builds the dot indicators to indicate current page.
  Widget _buildDotIndicators() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          OnBoardData.length,
          (index) => Padding(
            padding: EdgeInsets.only(right: 6.w),
            child: GestureDetector(
              onTap: () => _controller.onDotIndicatorTap(index),
              child: DotIndicator(isActive: index == _controller.pageIndex),
            ),
          ),
        ),
      ),
    );
  }

  /// Builds the action button (Next/Start).
  Widget _buildActionButton() {
    return AppButton(
      onTap: () => _controller.onBoardingButtonAction(context),
      text: _controller.pageIndex == OnBoardData.length - 1 ? "Start" : "Next",
    );
  }
}
