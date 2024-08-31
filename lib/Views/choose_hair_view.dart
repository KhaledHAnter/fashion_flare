import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_flare/Views/nav_home_view.dart';
import 'package:fashion_flare/Views/your_3d_model.dart';
import 'package:fashion_flare/Widgets/app_button.dart';
import 'package:fashion_flare/Widgets/app_text.dart';
import 'package:fashion_flare/Widgets/dot_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ChooseHairView extends StatefulWidget {
  const ChooseHairView({super.key});

  static String id = 'Choose Hair';

  @override
  State<ChooseHairView> createState() => _ChooseHairViewState();
}

class _ChooseHairViewState extends State<ChooseHairView> {
  List<String> hairstyles = [];

  Future<void> fetchData() async {
    try {
      // Replace 'collectionName' with your collection name and 'documentID' with your document ID
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('Choose HairStyle')
          .doc('gMmijVJV0YSRrna7kMAf')
          .get();

      if (documentSnapshot.exists) {
        List<dynamic> data = documentSnapshot['images'];
        setState(() {
          hairstyles = List<String>.from(data);
        });
      } else {
        print("Document does not exist");
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  late PageController pc;
  int _pageIndex = 0;

  @override
  void initState() {
    pc = PageController(initialPage: 0, viewportFraction: .8);

    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  AppText(
                    text: "Choose your hair style",
                    size: 34.sp,
                    weight: FontWeight.w700,
                  ),
                  Gap(8.h),
                  AppText(
                    text:
                        "Select a hairstyle that suits you best from the options below:",
                    size: 16.sp,
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              height: MediaQuery.of(context).size.height * .411,
              width: double.infinity,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                onPageChanged: (value) {
                  setState(() {
                    _pageIndex = value;
                  });
                },
                controller: pc,
                itemCount: hairstyles.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Container(
                      constraints: BoxConstraints(minHeight: 250.h),
                      decoration: BoxDecoration(
                        color: const Color(0XFFECF1F4),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: hairstyles[index],
                        key: UniqueKey(),
                        fit: BoxFit.fitHeight,
                        placeholder: (context, url) {
                          return Center(
                            child: LoadingAnimationWidget.discreteCircle(
                                color: Colors.black, size: 50),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            Gap(16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                hairstyles.length,
                (index) => Padding(
                  padding: EdgeInsets.only(right: 6.w),
                  child: GestureDetector(
                    onTap: () {
                      pc.animateToPage(
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
            const Spacer(),
            AppButton(
              text: "Continue",
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Your3DModel.id,
                  arguments: _pageIndex,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
