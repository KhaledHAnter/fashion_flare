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
