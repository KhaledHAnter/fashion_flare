import '../../../../Core/widgets/custom_app_bar.dart';

import '../../../../Core/Helper/extentions.dart';
import '../../../../Core/routing/routes.dart';
import '../../../Home/data/models/item_model.dart';
import '../../../Home/UI/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishListView extends StatefulWidget {
  const WishListView({super.key});

  @override
  State<WishListView> createState() => _WishListViewState();
}

class _WishListViewState extends State<WishListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 50.h),
        child: Column(
          children: [
            CustomAppBar(
              title: "Wishlist",
              image: "assets/Icons/Shopping bag.png",
              onTap: () {
                context.pushNamed(Routes.cartView);
              },
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .65,
                  crossAxisSpacing: 10,
                ),
                physics: const BouncingScrollPhysics(),
                itemCount: favoriteItems.length,
                padding: const EdgeInsets.all(0),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.pushNamed(Routes.itemDetailsView,
                          arguments: itemsData[index]);
                    },
                    child: ItemCard(
                      onTap: () {
                        if (mounted) {
                          setState(() {
                            itemsData[index].isFavourite =
                                !itemsData[index].isFavourite;
                          });
                        }
                      },
                      wishlist: true,
                      imagePath: itemsData[index].image,
                      itemFav: itemsData[index].isFavourite,
                      title: itemsData[index].title,
                      price: 100.0,
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
