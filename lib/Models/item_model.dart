import 'package:flutter/material.dart';

class itemModel {
  String title, image, price;
  bool isFavourite;
  String? discountPrice,
      mainfabric,
      pattern,
      fit,
      thickness,
      sleevelength,
      prducttype,
      season,
      ocassion,
      gender;
  List? images, colors, sizes;

  itemModel({
    required this.title,
    required this.image,
    required this.price,
    this.isFavourite = false,
    this.discountPrice,
    this.images,
    this.colors,
    this.sizes,
    this.fit,
    this.gender,
    this.ocassion,
    this.pattern,
    this.mainfabric,
    this.prducttype,
    this.season,
    this.sleevelength,
    this.thickness,
  });
}

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
    images: [
      "assets/Images/7.1.png",
      "assets/Images/7.2.png",
    ],
    colors: <Color>[
      Colors.deepPurpleAccent,
      Colors.blueGrey.shade200,
      Colors.red,
    ],
    sizes: <String>[
      "S",
      "M",
      "L",
      "XL",
      "2XL",
      "3XL",
    ],
    mainfabric: "100% cotton",
    pattern: "Plain",
    fit: "Comfortable Cut",
    thickness: "Thick",
    sleevelength: "Short Sleeve",
    prducttype: "Shirt",
    ocassion: "Casual",
    season: "Summer",
    gender: "Male",
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
  itemModel(
    title: "Jacket",
    price: r"$559.99",
    discountPrice: r"$200.99",
    image: "assets/Images/6.5.png",
    isFavourite: false,
  ),
  itemModel(
    title: "Long Sleeve T-shirt",
    price: r"$299.99",
    discountPrice: r"$150.99",
    image: "assets/Images/6.6.png",
    isFavourite: false,
  ),
];

final List favoriteItems = [
  for (int i = 0; i < itemsData.length; i++)
    // itemsData[i].isFavourite
    //     ? itemModel(
    //         title: itemsData[i].title,
    //         image: itemsData[i].image,
    //         price: itemsData[i].price)
    //     : null

    if (itemsData[i].isFavourite == true)
      {
        itemModel(
            title: itemsData[i].title,
            image: itemsData[i].image,
            price: itemsData[i].price)
      }
];
