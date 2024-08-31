class StoreItemModel {
  final num orderId;
  final num price;
  final String title;
  bool isFavourite;
  final List images;
  final List colors;
  final List sizes;
  final String fit;
  final String gender;
  final String ocassion;
  final String pattern;
  final String mainFabric;
  final String productType;
  final String season;
  final String sleeveLength;
  final String thickness;

  StoreItemModel({
    required this.orderId,
    required this.price,
    required this.title,
    required this.isFavourite,
    required this.images,
    required this.colors,
    required this.sizes,
    required this.fit,
    required this.gender,
    required this.ocassion,
    required this.pattern,
    required this.mainFabric,
    required this.productType,
    required this.season,
    required this.sleeveLength,
    required this.thickness,
  });

  factory StoreItemModel.fromJson(jsonData) {
    return StoreItemModel(
      orderId: jsonData['orderId'],
      price: jsonData['price'],
      title: jsonData['title'],
      isFavourite: jsonData['isFavourite'],
      images: jsonData['images'],
      colors: jsonData['colors'],
      sizes: jsonData['sizes'],
      fit: jsonData['fit'],
      gender: jsonData['gender'],
      ocassion: jsonData['ocassion'],
      pattern: jsonData['pattern'],
      mainFabric: jsonData['mainFabric'],
      productType: jsonData['productType'],
      season: jsonData['season'],
      sleeveLength: jsonData['sleeveLength'],
      thickness: jsonData['thickness'],
    );
  }
}
