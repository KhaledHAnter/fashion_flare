import 'package:fashion_flare/Models/item_model.dart';
import 'package:fashion_flare/Widgets/custom_floating_app_bar.dart';
import 'package:fashion_flare/Widgets/discont_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OffersView extends StatefulWidget {
  const OffersView({super.key});

  static String id = 'Offers';

  @override
  State<OffersView> createState() => _OffersViewState();
}

class _OffersViewState extends State<OffersView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50.h, right: 16.w, left: 16.w),
        child: Column(
          children: <Widget>[
            const CustomFloatingAppBar(
              title: "OFFERS",
              icon: Icons.arrow_back_ios_new_rounded,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 2,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.6),
                itemBuilder: (context, index) {
                  return DiscountItemCard(
                    onTap: () {
                      setState(() {
                        itemsData[index + 4].isFavourite =
                            !itemsData[index + 4].isFavourite;
                      });
                    },
                    imagePath: itemsData[index + 4].image,
                    itemFav: itemsData[index + 4].isFavourite,
                    title: itemsData[index + 4].title,
                    index: index + 1,
                    newPrice: itemsData[index + 4].discountPrice ??
                        itemsData[index + 4].price,
                    oldPrice: itemsData[index + 4].price,
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
