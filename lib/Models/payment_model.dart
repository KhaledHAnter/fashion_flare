class PaymentModel {
  String cardNumber;
  String expiryDate;
  String cardHolderName;
  String cvvCode;

  PaymentModel({
    required this.cardNumber,
    required this.expiryDate,
    required this.cardHolderName,
    required this.cvvCode,
  });
}

final List<PaymentModel> paymentData = [
  PaymentModel(
    cardNumber: "4242424242424242",
    expiryDate: "04/24",
    cardHolderName: "Jimmy Depp",
    cvvCode: "123",
  )
];
