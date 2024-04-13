class itemModel {
  String title, image, price;
  bool isFavourite;
  String? discountPrice;

  itemModel(
      {required this.title,
      required this.image,
      required this.price,
      this.isFavourite = false,
      this.discountPrice});
}
