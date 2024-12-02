class Food {
  final String name;
  final String description;
  final String imagePath;
  double price;
  final FoodCategory category;
  List<Addon> availbleAddons;

  Food({required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availbleAddons});
}

// Food categories
enum FoodCategory{
  burgers,
  salads,
  sides,
  desserts,
  drinks
}

// Food addons
class Addon {
  final String name;
  double price;
  Addon({
    required this.name,
    required this.price
});
}
