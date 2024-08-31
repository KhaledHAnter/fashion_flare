class StyleModel {
  String name;
  bool isSelected;

  StyleModel({
    required this.name,
    this.isSelected = false,
  });
}



final List<StyleModel> styleData = [
  StyleModel(name: "Classic"),
  StyleModel(name: "Casual"),
  StyleModel(name: "Bohemian"),
  StyleModel(name: "Minimalist"),
  StyleModel(name: "Urban"),
  StyleModel(name: "Vintage"),
  StyleModel(name: "Formal/Business"),
  StyleModel(name: "Sporty/Active"),
  StyleModel(name: "Preppy"),
  StyleModel(name: "Romantic"),
  StyleModel(name: "Edgy"),
  StyleModel(name: "Streetwear"),
  StyleModel(name: "Retro"),
  StyleModel(name: "Chic/Elegant"),
  StyleModel(name: "Artsy"),
];
