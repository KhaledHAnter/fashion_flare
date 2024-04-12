import 'package:fashion_flare/Models/category_model.dart';
import 'package:fashion_flare/Models/item_model.dart';
import 'package:fashion_flare/Widgets/app_text.dart';
import 'package:fashion_flare/Widgets/item_card.dart';
import 'package:fashion_flare/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static String id = 'Home';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentCategoryIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        gap: 8.w,
        backgroundColor: Colors.black,
        color: Colors.white,
        activeColor: Colors.white,
        haptic: true,
        tabs: [
          GButton(
            icon: Icons.home,
            iconSize: 25.r,
            text: "Home",
          ),
          GButton(
            icon: Icons.favorite,
            iconSize: 25.r,
            text: "Wishlist",
          ),
          GButton(
            icon: FontAwesomeIcons.shirt,
            iconSize: 20.r,
            text: "Wardrobe",
          ),
          GButton(
            icon: Icons.person,
            iconSize: 25.r,
            text: "Profile",
          ),
        ],
      ),
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
                        text: "Jimmy Depp",
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
            Gap(18.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
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
                Gap(20.w),
                Container(
                  constraints: BoxConstraints(minHeight: 49.h, minWidth: 44.w),
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.5.h),
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset("assets/Icons/Settings Slider.png"),
                ),
              ],
            ),
            Gap(18.h),
            SizedBox(
              height: 86.h,
              width: double.infinity,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 10.w),
                    height: 86.h,
                    width: 300.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/Images/5.${index + 1}.png"),
                      ),
                    ),
                  );
                },
              ),
            ),
            Gap(8.h),
            SizedBox(
              height: 36.h,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: categoriesData.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentCategoryIndex = index;
                        categoriesData[index].isSelected = true;
                      });
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
                itemCount: 4,
                padding: const EdgeInsets.all(0),
                itemBuilder: (context, index) {
                  return ItemCard(
                    onTap: () {
                      setState(() {
                        itemsData[index].isFavourite =
                            !itemsData[index].isFavourite;
                      });
                    },
                    imagePath: itemsData[index].image,
                    itemFav: itemsData[index].isFavourite,
                    title: itemsData[index].title,
                    price: itemsData[index].price,
                    index: index + 1,
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

final List<CategoryModel> categoriesData = [
  CategoryModel(title: "All Items", image: "assets/Icons/2.1.png"),
  CategoryModel(title: "Jacket", image: "assets/Icons/2.2.png"),
  CategoryModel(title: "Shirt", image: "assets/Icons/2.3.png"),
  CategoryModel(title: "Shorts", image: "assets/Icons/2.4.png"),
  CategoryModel(title: "Skirt", image: "assets/Icons/2.5.png"),
  CategoryModel(title: "Suit", image: "assets/Icons/2.6.png"),
  CategoryModel(title: "T-shirt", image: "assets/Icons/2.7.png"),
  CategoryModel(title: "Jeans", image: "assets/Icons/2.8.png"),
  CategoryModel(title: "Dresss", image: "assets/Icons/2.9.png"),
  CategoryModel(title: "Womens T-shirt", image: "assets/Icons/2.10.png"),
];

final List<itemModel> itemsData = [
  itemModel(
    title: "Long Sleeve T-shirt",
    price: r"$452.99",
    image: "assets/Images/6.1.png",
    isFavourite: false,
  ),
  itemModel(
    title: "Short Sleeve T-shirt",
    price: r"$212.99",
    image: "assets/Images/6.2.png",
    isFavourite: false,
  ),
  itemModel(
    title: "Puffer Jackett",
    price: r"$550.99",
    image: "assets/Images/6.3.png",
    isFavourite: false,
  ),
  itemModel(
    title: "Turtle Neck Shirt",
    price: r"$499.99",
    image: "assets/Images/6.4.png",
    isFavourite: false,
  ),
];
