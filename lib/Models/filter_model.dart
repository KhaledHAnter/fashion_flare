import 'package:flutter/material.dart';

class filterModel {
  String filterName;
  List<dynamic> filterList;

  filterModel({required this.filterName, required this.filterList});
}

class filterItem {
  String name;
  bool isSelected;
  filterItem({required this.name, this.isSelected = false});
}

final List<filterModel> filterData = [
  filterModel(
    filterName: "Gender",
    filterList: <filterItem>[
      filterItem(name: "All"),
      filterItem(name: "Male"),
      filterItem(name: "Female"),
    ],
  ),
  filterModel(
    filterName: "Category",
    filterList: <filterItem>[
      filterItem(name: "All"),
      filterItem(name: "Tops"),
      filterItem(name: "Bottoms"),
      filterItem(name: "Outerwear"),
    ],
  ),
  filterModel(
    filterName: "Sizes",
    filterList: <filterItem>[
      filterItem(name: "XS"),
      filterItem(name: "S"),
      filterItem(name: "M"),
      filterItem(name: "L"),
      filterItem(name: "XL"),
      filterItem(name: "2XL"),
      filterItem(name: "3XL"),
    ],
  ),
  filterModel(
    filterName: "Colors",
    filterList: [
      Colors.redAccent,
      Colors.blueGrey,
      Colors.white,
      Colors.black,
      Colors.yellow,
      Colors.greenAccent,
    ],
  ),
];
