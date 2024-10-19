import 'package:dio/dio.dart';
import '../../../../Core/Helper/extentions.dart';
import '../../../../Core/routing/routes.dart';
import '../../../Home/data/models/weather_model.dart';
import '../../../../Core/Services/weather_services.dart';
import '../../../../Core/widgets/app_button.dart';
import '../../../../Core/widgets/app_text.dart';
import '../../../../Core/widgets/custom_button.dart';
import '../../../../Core/widgets/custom_floating_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

  void fetchData({required String cityName}) async {
    WeatherModel? weatherModel;
    weatherModel =
        await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
    setState(() {
      weatherModelData = weatherModel;
    });
    print(weatherModelData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * .25,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(8.r),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomButton(
                          text: "Pick From Gallery",
                          onTap: () {
                            _pickImageFromGallery();
                            context.pop();

                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SizedBox(
                                    width: double.infinity,
                                    height:
                                        MediaQuery.of(context).size.height * .3,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        const Spacer(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            AppText(
                                              text: "Type :   ",
                                              weight: FontWeight.bold,
                                              size: 22.sp,
                                            ),
                                            const AppText(
                                              text: "T-Shirt",
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            AppText(
                                              text: "Style :   ",
                                              weight: FontWeight.bold,
                                              size: 22.sp,
                                            ),
                                            const AppText(
                                              text: "Casual",
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            AppText(
                                              text: "Color :   ",
                                              weight: FontWeight.bold,
                                              size: 22.sp,
                                            ),
                                            const AppText(
                                              text: "Black (Dark)",
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            AppText(
                                              text: "Season :   ",
                                              weight: FontWeight.bold,
                                              size: 22.sp,
                                            ),
                                            const AppText(
                                              text: "Summer",
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        AppButton(
                                            text: "Confirm",
                                            onTap: () {
                                              context.pop();
                                            }),
                                      ],
                                    ));
                              },
                            );
                          },
                        ),
                        CustomButton(
                          text: "Pick From Camera",
                          onTap: () {
                            _pickImageFromCamera();

                            context.pop();
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SizedBox(
                                    width: double.infinity,
                                    height:
                                        MediaQuery.of(context).size.height * .3,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        const Spacer(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            AppText(
                                              text: "Type :   ",
                                              weight: FontWeight.bold,
                                              size: 22.sp,
                                            ),
                                            const AppText(
                                              text: "T-Shirt",
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            AppText(
                                              text: "Style :   ",
                                              weight: FontWeight.bold,
                                              size: 22.sp,
                                            ),
                                            const AppText(
                                              text: "Casual",
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            AppText(
                                              text: "Color :   ",
                                              weight: FontWeight.bold,
                                              size: 22.sp,
                                            ),
                                            const AppText(
                                              text: "Black (Dark)",
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            AppText(
                                              text: "Season :   ",
                                              weight: FontWeight.bold,
                                              size: 22.sp,
                                            ),
                                            const AppText(
                                              text: "Summer",
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        AppButton(
                                            text: "Confirm",
                                            onTap: () {
                                              context.pop();
                                            }),
                                      ],
                                    ));
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              });
          //   addStoeItem(
          //     orderId: 8,
          //     price: 319.99,
          //     title: "Turtle Neck Sweater",
          //     isFavourite: false,
          //     images: [
          //       "https://firebasestorage.googleapis.com/v0/b/fashion-flare-56391.appspot.com/o/9%2FTurtuleneck%20colorful.png?alt=media&token=ad020104-7ee9-4235-8606-0a10b000a234",
          //       "https://firebasestorage.googleapis.com/v0/b/fashion-flare-56391.appspot.com/o/9%2FTurtuleneck%20green.png?alt=media&token=d0c59e92-7f9a-48fb-a89e-3b884899c995",
          //     ],
          //     colors: [
          //       "Purple",
          //       "Green",
          //     ],
          //     sizes: [
          //       "S",
          //       "M",
          //       "L",
          //       "XL",
          //     ],
          //     fit: "Comfortable Cut",
          //     gender: "Unisex",
          //     ocassion: "Casual",
          //     pattern: "Plain",
          //     mainFabric: "100% cotton",
          //     productType: "Sweater",
          //     season: "Winter",
          //     sleeveLength: "Long sleeve",
          //     thickness: "Thick",
          //   );
        },
        child: const Icon(
          FontAwesomeIcons.camera,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 50.h),
        child: Column(
          children: <Widget>[
            const CustomFloatingAppBar(
              title: "WARDROBE",
              icon: Icons.arrow_back_ios_new_rounded,
              visible: false,
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
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 8.w),
            //   constraints: BoxConstraints(minHeight: 70.h),
            //   width: double.infinity,
            //   decoration: const BoxDecoration(
            //     color: kPrimaryColor,
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: <Widget>[
            //       SizedBox(
            //           width: 110.w, child: const AppText(text: "Generate")),
            //       const Icon(
            //         Icons.camera_alt_outlined,
            //         size: 40,
            //       ),
            //       SizedBox(width: 110.w, child: const AppText(text: "Save")),
            //     ],
            //   ),
            // ),
            // Text("${weatherModelData!.cityName} °C"),
            // Text("${weatherModelData!.temp} °C"),
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

Future _pickImageFromGallery() async {
  final ImagePicker picker = ImagePicker();
  XFile? image = await picker.pickImage(source: ImageSource.gallery);
  if (image == null) {
    return;
  }
  return image;
}

Future _pickImageFromCamera() async {
  final ImagePicker picker = ImagePicker();
  XFile? image = await picker.pickImage(source: ImageSource.camera);
  if (image == null) {
    return;
  }
  return image;
}
