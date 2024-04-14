class CategoryModel {
  bool isSelected;
  String title, image;

  CategoryModel({
    this.isSelected = false,
    required this.title,
    required this.image,
  });
}

final List<CategoryModel> categoriesData = [
  CategoryModel(title: "All Items", image: "assets/Icons/2.1.png"),
  CategoryModel(title: "Jacket", image: "assets/Icons/2.2.png"),
  CategoryModel(title: "Shirt", image: "assets/Icons/2.3.png"),
  CategoryModel(title: "Shorts", image: "assets/Icons/2.4.png"),
  CategoryModel(title: "Skirt", image: "assets/Icons/2.5.png"),
  CategoryModel(title: "Suit", image: "assets/Icons/2.6.png"),
  CategoryModel(title: "T-shirt", image: "assets/Icons/2.7.png"),
  CategoryModel(title: "Jeans", image: "assets/Icons/2.8.png"),
  CategoryModel(title: "Dresss", image: "assets/Icons/2.9.png"),
  CategoryModel(title: "Womens T-shirt", image: "assets/Icons/2.10.png"),
];
