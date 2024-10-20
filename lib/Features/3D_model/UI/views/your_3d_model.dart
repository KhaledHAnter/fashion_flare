import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../Core/Helper/extentions.dart';
import '../../../../Core/routing/routes.dart';
import '../../../../Core/widgets/app_button.dart';
import '../../../../Core/widgets/app_text.dart';

class Your3DModel extends StatefulWidget {
  final int args;
  const Your3DModel({super.key, required this.args});

  @override
  State<Your3DModel> createState() => _Your3DModelState();
}

class _Your3DModelState extends State<Your3DModel> {
  List<String> models3D = [];

  Future<void> fetchData() async {
    try {
      // Replace 'collectionName' with your collection name and 'documentID' with your document ID
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('Meet Your Model')
          .doc('jx9hpoao4dvwN6hk1n0W')
          .get();

      if (documentSnapshot.exists) {
        List<dynamic> data = documentSnapshot['images'];
        setState(() {
          models3D = List<String>.from(data);
        });
      } else {}
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  @override
  void initState() {
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
                    text: "Your 3D Model",
                    size: 40.sp,
                    weight: FontWeight.w700,
                  ),
                  Gap(8.h),
                  AppText(
                    text:
                        "Here's your 3D model where you'll see your selected items come to life.",
                    size: 16.sp,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 10,
              child: models3D.isEmpty
                  ? Center(
                      child: LoadingAnimationWidget.discreteCircle(
                          color: Colors.black, size: 50))
                  : CachedNetworkImage(
                      imageUrl: models3D[widget.args],
                      key: UniqueKey(),
                      fit: BoxFit.cover,
                      placeholder: (context, url) {
                        return Center(
                          child: LoadingAnimationWidget.discreteCircle(
                              color: Colors.black, size: 50),
                        );
                      },
                    ),
            ),
            Expanded(
              flex: 1,
              child: AppButton(
                text: "Continue",
                onTap: () {
                  context.pushNamedAndRemoveUntil(Routes.navHomeView,
                      predicate: (Route<dynamic> route) => false);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
