import 'dart:convert';

class Recipe {
  late int id;
  late String title;
  late String image;

  Recipe({required this.id, required this.title, required this.image});

  factory Recipe.fromMap(Map<String, dynamic> json) =>
      Recipe(id: json["id"], title: json["title"], image: json["image"]);

  Map<String, dynamic> toMap() => {"id": id, "title": title, "image": image};

  Recipe recipeFromJson(String str) => Recipe.fromMap(json.decode(str));

  String recipeToJson(Recipe data) => json.encode(data.toMap());
}
