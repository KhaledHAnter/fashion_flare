import 'package:fashion_flare/Models/item_model.dart';
import 'package:fashion_flare/Widgets/app_text.dart';
import 'package:fashion_flare/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

final List<String> searchData = [
  for (int i = 0; i < itemsData.length; i++) itemsData[i].title
];

List filteredList = [];

class customSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text("data");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    filteredList = searchData
        .where(
          (element) => element.toLowerCase().contains(
                query.toLowerCase(),
              ),
        )
        .toList();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          query == ""
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    AppText(
                      text: "Recent",
                      weight: FontWeight.w700,
                      size: 18.sp,
                    ),
                    AppText(
                      text: "Clear all",
                      size: 16.sp,
                      color: kSecondaryFontColor,
                    ),
                  ],
                )
              : AppText(
                  text: "Results for $query ...",
                  size: 22.sp,
                  textAlign: TextAlign.right,
                  weight: FontWeight.w700,
                ),
          Gap(20.h),
          Expanded(
            child: query == ""
                ? ListView.builder(
                    itemCount: searchData.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            AppText(
                              text: searchData[index],
                            ),
                            const Icon(
                              Icons.close,
                            ),
                          ],
                        ),
                      );
                    },
                  )
                : ListView.builder(
                    itemCount: filteredList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: AppText(
                          textAlign: TextAlign.start,
                          text: filteredList[index],
                        ),
                      );
                    },
                  ),
          )
        ],
      ),
    );
  }
}
