import 'package:fashion_flare/Models/onboard.dart';
import 'package:fashion_flare/Views/user_credentials_view.dart';
import 'package:fashion_flare/Widgets/app_button.dart';
import 'package:fashion_flare/Widgets/dot_indicator.dart';
import 'package:fashion_flare/Widgets/onboarding_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  static const String id = 'Onboarding';

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  bool notLastScreen = true;
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 21,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: OnBoardData.length,
                onPageChanged: (value) {
                  setState(() {
                    _pageIndex = value;
                  });
                },
                controller: _pageController,
                itemBuilder: (context, index) {
                  return OnBoardingContent(
                    image: OnBoardData[index].image,
                    title: OnBoardData[index].title,
                    description: OnBoardData[index].description,
                    screenNum: index + 1,
                    onTap: () {
                      _pageController.jumpToPage(
                        2,
                      );
                    },
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  OnBoardData.length,
                  (index) => Padding(
                    padding: EdgeInsets.only(right: 6.w),
                    child: GestureDetector(
                      onTap: () {
                        _pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeIn,
                        );
                      },
                      child: DotIndicator(
                        isActive: index == _pageIndex,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: AppButton(
                onTap: () {
                  if (_pageIndex == 2) {
                    Navigator.pushNamed(context, UserCredentialsView.id);
                  } else {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeIn,
                    );
                  }
                },
                text: _pageIndex == 2 ? "Start" : "Next",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
