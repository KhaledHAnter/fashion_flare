import '../../../../Core/Helper/extentions.dart';
import '../../../../Core/routing/routes.dart';
import '../../../Home/data/models/weather_model.dart';
import '../../../../Core/widgets/app_button.dart';
import '../../../../Core/widgets/custom_floating_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class WardrobeView extends StatefulWidget {
  const WardrobeView({super.key});

  @override
  State<WardrobeView> createState() => _WardrobeViewState();
}

class _WardrobeViewState extends State<WardrobeView> {
  late PageController pc1;
  int _pageIndex1 = 1;
  late PageController pc2;
  int _pageIndex2 = 1;
  late PageController pc3;
  int _pageIndex3 = 1;
  late PageController pc4;
  int _pageIndex4 = 1;

  WeatherModel? weatherModelData;

  @override
  void initState() {
    pc1 = PageController(initialPage: 1, viewportFraction: .50);
    pc2 = PageController(initialPage: 1, viewportFraction: .5);
    pc3 = PageController(initialPage: 1, viewportFraction: .5);
    pc4 = PageController(initialPage: 1, viewportFraction: .5);

    // fetchData(cityName: "London");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50.h),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const CustomFloatingAppBar(
                title: "WARDROBE",
                icon: Icons.arrow_back_ios_new_rounded,
                visible: true,
              ),
            ),
            const Spacer(),
            SizedBox(
              height: MediaQuery.of(context).size.height * .16,
              width: double.infinity,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                onPageChanged: (value) {
                  setState(() {
                    _pageIndex1 = value;
                  });
                },
                controller: pc1,
                itemCount: wardrobeData1.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Container(
                      constraints: BoxConstraints(minHeight: 250.h),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: index == 0
                          ? const SizedBox()
                          : Image.asset(wardrobeData1[index]),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .16,
              width: double.infinity,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                onPageChanged: (value) {
                  setState(() {
                    _pageIndex2 = value;
                  });
                },
                controller: pc2,
                itemCount: wardrobeData2.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Container(
                      constraints: BoxConstraints(minHeight: 250.h),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Image.asset(wardrobeData2[index]),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .16,
              width: double.infinity,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                onPageChanged: (value) {
                  setState(() {
                    _pageIndex3 = value;
                  });
                },
                controller: pc3,
                itemCount: wardrobeData3.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Container(
                      constraints: BoxConstraints(minHeight: 250.h),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Image.asset(wardrobeData3[index]),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .16,
              width: double.infinity,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                onPageChanged: (value) {
                  setState(() {
                    _pageIndex4 = value;
                  });
                },
                controller: pc4,
                itemCount: wardrobeData4.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Container(
                      constraints: BoxConstraints(minHeight: 250.h),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Image.asset(wardrobeData4[index]),
                    ),
                  );
                },
              ),
            ),
            const Spacer(),
            AppButton(
                text: "Generate",
                onTap: () {
                  List<String> list = [
                    _pageIndex1.toString(),
                    _pageIndex2.toString(),
                    _pageIndex3.toString(),
                    _pageIndex4.toString(),
                  ];
                  if (_pageIndex1 == 3 ||
                      _pageIndex2 == 2 ||
                      _pageIndex2 == 0 ||
                      _pageIndex3 == 2 ||
                      _pageIndex4 == 0 ||
                      _pageIndex4 == 1) {
                    return;
                  } else if (_pageIndex2 == 3 && !(_pageIndex1 == 0)) {
                    return;
                  } else {
                    context.pushNamed(Routes.generatedOutfitView,
                        arguments: list);
                  }
                }),
          ],
        ),
      ),
    );
  }
}

List<String> wardrobeData1 = [
  "",
  "assets/Images/10.png",
  "assets/Images/11.png",
  "assets/Images/12.png",
];
List<String> wardrobeData2 = [
  "assets/Images/13.png",
  "assets/Images/14.png",
  "assets/Images/15.png",
  "assets/Images/add ward.png",
];
List<String> wardrobeData3 = [
  "assets/Images/16.png",
  "assets/Images/17.png",
  "assets/Images/18.png",
];
List<String> wardrobeData4 = [
  "assets/Images/19.png",
  "assets/Images/20.png",
  "assets/Images/21.png",
];
