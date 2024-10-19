class PaymentModel {
  String cardName, cvv, expMonth, expYear;
  num cardNum;

  PaymentModel({
    required this.cardName,
    required this.cvv,
    required this.cardNum,
    required this.expMonth,
    required this.expYear,
  });

  factory PaymentModel.fromJson(jsonData) {
    return PaymentModel(
      cardName: jsonData['cardName'],
      cvv: jsonData['CVV'],
      cardNum: jsonData['cardNum'],
      expMonth: jsonData['expMonth'],
      expYear: jsonData['expYear'],
    );
  }
}
