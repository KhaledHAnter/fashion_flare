import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_flare/Core/Helper/constants.dart';
import 'package:fashion_flare/Features/Filter_home/UI/views/filter_view.dart';
import 'package:fashion_flare/Features/Item_details/UI/views/item_details_view.dart';
import 'package:fashion_flare/Features/Recommendations/UI/views/nearby_shops_view.dart';
import 'package:fashion_flare/Features/Recommendations/UI/views/offers_view.dart';
import 'package:fashion_flare/Features/Recommendations/UI/views/today_outfit_view.dart';
import 'package:fashion_flare/Models/category_model.dart';
import 'package:fashion_flare/Models/search_delegate_model.dart';
import 'package:fashion_flare/Models/store_item_model.dart';
import 'package:fashion_flare/Widgets/app_text.dart';
import 'package:fashion_flare/Widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static String id = 'Home';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentCategoryIndex = 0;

  List<StoreItemModel> storeProducts = [];

  getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("StoreItems")
        .orderBy('orderId')
        .get();
    setState(() {
      // products.addAll();
      for (int i = 0; i < querySnapshot.docs.length; i++) {
        storeProducts
            .add(StoreItemModel.fromJson(querySnapshot.docs[i].data()));
      }
    });
  }

  @override
  void initState() {
    getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(right: 25.w, left: 25.w, top: 50.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: "HELLO, Welcome 👋\n",
                        style: TextStyle(
                          letterSpacing: 2,
                          fontFamily: kFontFamily,
                          fontSize: 18.sp,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: "Khaled H. Anter",
                        style: TextStyle(
                          wordSpacing: 2,
                          fontFamily: kFontFamily,
                          fontSize: 22.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 30.r,
                  child: Image.asset(
                    "assets/Icons/profile.png",
                  ),
                ),
              ],
            ),
            Gap(8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      showSearch(
                          context: context, delegate: customSearchDelegate());
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: kSecondaryFontColor),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.search,
                            size: 24.r,
                            color: kSecondaryFontColor,
                          ),
                          Gap(8.w),
                          AppText(
                            text: "Search clothes. . . ",
                            color: kSecondaryFontColor,
                            size: 16.sp,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Gap(20.w),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, FilterView.id);
                  },
                  child: Container(
                    constraints:
                        BoxConstraints(minHeight: 49.h, minWidth: 44.w),
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.w, vertical: 12.5.h),
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.asset("assets/Icons/Settings Slider.png"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 86.h,
              width: double.infinity,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      switch (index) {
                        case 0:
                          Navigator.pushNamed(context, TodayOutfitView.id);
                          break;
                        case 1:
                          Navigator.pushNamed(context, NearbyShops.id);

                          break;
                        case 2:
                          Navigator.pushNamed(context, OffersView.id);

                          break;
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 10.w),
                      height: 86.h,
                      width: 300.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/Images/5.${index + 1}.png"),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 36.h,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: categoriesData.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (mounted) {
                        setState(() {
                          currentCategoryIndex = index;
                          categoriesData[index].isSelected = true;
                        });
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: currentCategoryIndex == index
                            ? null
                            : Border.all(
                                color: kSecondaryFontColor.withOpacity(.5)),
                        color: currentCategoryIndex == index
                            ? kPrimaryColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      margin: EdgeInsets.only(right: 15.w),
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 1.h),
                      child: Row(
                        children: <Widget>[
                          Image.asset(categoriesData[index].image),
                          Gap(4.w),
                          AppText(
                            text: categoriesData[index].title,
                            size: 14.sp,
                            weight: FontWeight.w700,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Gap(24.h),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .65,
                  crossAxisSpacing: 10,
                ),
                physics: const BouncingScrollPhysics(),
                itemCount: storeProducts.length,
                padding: const EdgeInsets.all(0),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ItemDetailsView.id,
                          arguments: storeProducts[index]);
                    },
                    child: ItemCard(
                      onTap: () {
                        if (mounted) {
                          setState(() {
                            storeProducts[index].isFavourite =
                                !storeProducts[index].isFavourite;
                          });
                        }
                      },
                      imagePath: storeProducts[index].images[0],
                      itemFav: storeProducts[index].isFavourite,
                      title: storeProducts[index].title,
                      price: storeProducts[index].price,
                      index: index + 1,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
