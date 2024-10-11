class OnBoard {
  String image, title, description;

  OnBoard({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<OnBoard> OnBoardData = [
  OnBoard(
    image: "assets/Images/2.1.png",
    title: "Dress Smarter",
    description:
        "Welcome to our AI recommendation system! Personalized outfit suggestions delivered with a friendly tone. Let us help you look and feel your best, effortlessly!",
  ),
  OnBoard(
    image: "assets/Images/2.2.png",
    title: "See It On You",
    description:
        "Try our 3D model feature for outfit visualization before purchase. Try on clothes virtually for confident decisions with ease!",
  ),
  OnBoard(
    image: "assets/Images/2.3.png",
    title: "Shop Seamlessly",
    description:
        "Explore seamless online shopping integration! Easily purchase recommended items with a focus on efficiency and convenience.",
  ),
];
