class Recipe {
  late int id;
  late int ingredientCount;
  late String name;
  late String imageURL;

  Recipe(
      {required this.id,
      required this.name,
      required this.imageURL,
      required this.ingredientCount});

  factory Recipe.fromMap(Map<String, dynamic> json) => Recipe(
      id: json["id"],
      name: json["name"],
      imageURL: json["imageURL"],
      ingredientCount: json["ingredient_count"]);

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "imageURL": imageURL,
        "ingredientCount": ingredientCount
      };
}
