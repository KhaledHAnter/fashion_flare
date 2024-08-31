class ShippingModel {
  final String name, address, number;

  ShippingModel({
    required this.name,
    required this.address,
    required this.number,
  });

  factory ShippingModel.fromJson(jsonData) {
    return ShippingModel(
      name: jsonData['name'],
      address: jsonData['address'],
      number: jsonData['number'],
    );
  }
}
