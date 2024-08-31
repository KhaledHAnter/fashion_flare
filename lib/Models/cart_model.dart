import 'package:fashion_flare/Models/item_model.dart';
import 'package:flutter/material.dart';

class CartModel {
  final String image;
  final String title;
  final double price;
  final String size;
  final Color color;
  int quantity;

  CartModel({
    required this.image,
    required this.title,
    required this.price,
    required this.size,
    required this.color,
    this.quantity = 1,
  });
}

final List<CartModel> cartData = [
  CartModel(
    image: itemsData[1].image,
    title: itemsData[1].title,
    price: 212.99,
    size: itemsData[1].sizes![3],
    color: itemsData[1].colors![0],
  )
];
