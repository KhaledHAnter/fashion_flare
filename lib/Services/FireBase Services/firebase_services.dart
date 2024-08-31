import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_flare/Models/payment_model.dart';
import 'package:fashion_flare/Models/shipping_model.dart';

// add payment
CollectionReference payment = FirebaseFirestore.instance.collection('payment');

Future<void> addToPayment({
  required num cardNum,
  required String cardName,
  CVV,
  expMonth,
  expYear,
}) {
  return payment
      .add({
        'cardNum': cardNum,
        'cardName': cardName,
        'CVV': CVV,
        'expMonth': expMonth,
        'expYear': expYear,
      })
      .then((value) => print("payment Added"))
      .catchError((error) => print("Failed to add payment: $error"));
}

// add order
CollectionReference order = FirebaseFirestore.instance.collection('orders');

Future<void> addToOrder({
  required num orderId,
  price,
}) {
  return order
      .add({
        'orderId': orderId,
        'price': price,
      })
      .then((value) => print("order Added "))
      .catchError((error) => print("Failed to add order: $error"));
}

// add item to store
CollectionReference storeItem =
    FirebaseFirestore.instance.collection('StoreItems');

Future<void> addStoeItem({
  required num orderId,
  required num price,
  required String title,
  required bool isFavourite,
  required List<String> images,
  required List colors,
  required List<String> sizes,
  required String fit,
  required String gender,
  required String ocassion,
  required String pattern,
  required String mainFabric,
  required String productType,
  required String season,
  required String sleeveLength,
  required String thickness,
}) {
  return storeItem
      .add({
        'orderId': orderId,
        'price': price,
        'title': title,
        'isFavourite': isFavourite,
        'images': images,
        'colors': colors,
        'sizes': sizes,
        'fit': fit,
        'gender': gender,
        'ocassion': ocassion,
        'pattern': pattern,
        'mainFabric': mainFabric,
        'productType': productType,
        'season': season,
        'sleeveLength': sleeveLength,
        'thickness': thickness,
      })
      .then((value) => print("item Added to store "))
      .catchError((error) => print("Failed to add item: $error"));
}

// get payment
List<PaymentModel> PaymentsData = [];

Future<List<PaymentModel>> getPayment() async {
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection("payment").get();

  // products.addAll();
  for (int i = 0; i < querySnapshot.docs.length; i++) {
    PaymentsData.add(PaymentModel.fromJson(querySnapshot.docs[i].data()));
  }
  return PaymentsData;
}

void clearPayment() {
  PaymentsData.clear();
}

// get all address
List<ShippingModel> addressData = [];

Future<List<ShippingModel>> getAddresses() async {
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection("address").get();

  for (int i = 0; i < querySnapshot.docs.length; i++) {
    addressData.add(ShippingModel.fromJson(querySnapshot.docs[i].data()));
  }
  return addressData;
}

void clearAddress() {
  addressData.clear();
}
