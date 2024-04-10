import 'package:fashion_flare/Helper/governorates.dart';
import 'package:fashion_flare/Models/user_details.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class chooseStyleView extends StatefulWidget {
  const chooseStyleView({super.key});

  static String id = 'Choose Style';

  @override
  State<chooseStyleView> createState() => _chooseStyleViewState();
}

class _chooseStyleViewState extends State<chooseStyleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoadingAnimationWidget.hexagonDots(
            color: Colors.redAccent, size: 100),
      ),
    );
  }
}

final List<UserDetailsModel> userDetailsData = [
  UserDetailsModel(listItems: ['Male', 'Female'], hintText: "Gender"),
  UserDetailsModel(listItems: [
    for (int i = 18; i <= 65; i++) i.toString(),
  ], hintText: "Age"),
  UserDetailsModel(listItems: [
    for (int i = 0; i < egyGovernoratesList.length; i++)
      egyGovernoratesList[i]['governorate_name_en'],
  ], hintText: "City"),
  UserDetailsModel(
      listItems: [for (int i = 140; i <= 220; i++) i.toString()],
      hintText: "Height"),
  UserDetailsModel(
      listItems: [for (int i = 40; i <= 120; i++) i.toString()],
      hintText: "Weight"),
];
