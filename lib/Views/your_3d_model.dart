import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_flare/Views/nav_home_view.dart';
import 'package:fashion_flare/Widgets/app_button.dart';
import 'package:fashion_flare/Widgets/app_text.dart';
import 'package:fashion_flare/Widgets/image_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Your3DModel extends StatefulWidget {
  const Your3DModel({super.key});

  static String id = 'Your 3d Model';

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
      } else {
        print("Document does not exist");
      }
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
    final args = ModalRoute.of(context)!.settings.arguments as int;
    print(args);

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
                      imageUrl: models3D[args],
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
                  Navigator.pushNamed(context, NavHomeView.id);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
