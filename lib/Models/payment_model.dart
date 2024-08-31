import 'package:flutter/foundation.dart';

class PaymentModel {
  String cardName, CVV, expMonth, expYear;
  num cardNum;

  PaymentModel({
    required this.cardName,
    required this.CVV,
    required this.cardNum,
    required this.expMonth,
    required this.expYear,
  });

  factory PaymentModel.fromJson(jsonData) {
    return PaymentModel(
      cardName: jsonData['cardName'],
      CVV: jsonData['CVV'],
      cardNum: jsonData['cardNum'],
      expMonth: jsonData['expMonth'],
      expYear: jsonData['expYear'],
    );
  }
}
