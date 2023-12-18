class Product {
  final int id;
  final String name;
  final String img;
  final String description;
  final String kcal;
  final String weight;
  final List<String> ingredients;

  Product({
    required this.id,
    required this.name,
    required this.img,
    required this.description,
    required this.kcal,
    required this.weight,
    required this.ingredients,
  });
}
