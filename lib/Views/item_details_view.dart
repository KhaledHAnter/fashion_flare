import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:fashion_flare/Helper/show_awsome_snakbar.dart';
import 'package:fashion_flare/Models/item_model.dart';
import 'package:fashion_flare/Widgets/app_button.dart';
import 'package:fashion_flare/Widgets/app_text.dart';
import 'package:fashion_flare/Widgets/custom_floating_app_bar.dart';
import 'package:fashion_flare/Widgets/dot_indicator.dart';
import 'package:fashion_flare/Widgets/info_bottom_sheet_content.dart';
import 'package:fashion_flare/Widgets/item_details_image.dart';
import 'package:fashion_flare/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ItemDetailsView extends StatefulWidget {
  const ItemDetailsView({super.key});

  static String id = 'Item Details';

  @override
  State<ItemDetailsView> createState() => _ItemDetailsViewState();
}

class _ItemDetailsViewState extends State<ItemDetailsView> {
  late PageController pc;
  int _pageIndex = 0;
  int _colorIndex = 0;
  int _sizeIndex = 0;

  @override
  void initState() {
    pc = PageController(initialPage: 0, viewportFraction: .8);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as itemModel;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 60.h),
        child: Column(
          children: <Widget>[
            const CustomFloatingAppBar(
              title: "MEN'S",
              icon: Icons.arrow_back_ios_new_rounded,
            ),
            Gap(20.h),
            Expanded(
              flex: 5,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                onPageChanged: (value) {
                  setState(() {
                    _pageIndex = value;
                  });
                },
                controller: pc,
                itemCount: args.images!.length ?? 1,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: ItemDetailsImage(
                      imagePath: args.images![index] ?? args.image,
                      itemFav: args.isFavourite,
                      onTap: () {
                        setState(() {
                          args.isFavourite = !args.isFavourite;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                args.images!.length ?? 1,
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
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    AppText(
                      text: "${args.title}\n${args.price}",
                      size: 24.sp,
                      weight: FontWeight.w700,
                      textAlign: TextAlign.start,
                    ),
                    Gap(12.h),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          showDragHandle: true,
                          context: context,
                          builder: (context) {
                            return InfoBottomSheetContent(args: args);
                          },
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 12.h),
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        width: double.infinity,
                        height: 60.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.r),
                            color: const Color(0XFFECF1F4)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              text: "INFORMATION",
                              size: 18.sp,
                            ),
                            const Icon(Icons.keyboard_arrow_down_rounded)
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 12.h),
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      width: double.infinity,
                      height: 60.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.r),
                          color: const Color(0XFFECF1F4)),
                      child: Row(
                        children: [
                          AppText(
                            text: "COLORS",
                            size: 18.sp,
                          ),
                          const Spacer(),
                          ...List.generate(args.colors!.length, (index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _colorIndex = index;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 20.w),
                                decoration: BoxDecoration(
                                  border: _colorIndex == index
                                      ? Border.all(
                                          color: Colors.black,
                                          width: 2.w,
                                        )
                                      : null,
                                  borderRadius: BorderRadius.circular(8),
                                  color: args.colors![index],
                                ),
                                constraints: BoxConstraints(
                                    maxHeight: 35.h, maxWidth: 50.w),
                              ),
                            );
                          })
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 12.h),
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      width: double.infinity,
                      height: 60.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.r),
                          color: const Color(0XFFECF1F4)),
                      child: Row(
                        children: [
                          AppText(
                            text: "Sizes",
                            size: 18.sp,
                          ),
                          const Spacer(),
                          ...List.generate(args.sizes!.length, (index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _sizeIndex = index;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                margin: EdgeInsets.only(left: 8.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: _sizeIndex == index
                                      ? kPrimaryColor
                                      : null,
                                ),
                                constraints: BoxConstraints(
                                    minHeight: 33.h, minWidth: 26.w),
                                child: AppText(
                                  text: args.sizes![index],
                                  size: 16.sp,
                                ),
                              ),
                            );
                          })
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AppButton(
              text: "ADD TO CART",
              onTap: () {
                showAwsomeSnakBar(context,
                    message: "Check your cart",
                    title: "Item added to cart",
                    type: ContentType.success);
              },
            )
          ],
        ),
      ),
    );
  }
}
