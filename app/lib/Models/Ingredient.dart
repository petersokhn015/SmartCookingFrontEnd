import 'dart:convert';

class Ingredient {
  final String imageUrl, name, unit;
  final int amount;

  Ingredient(
      {required this.imageUrl,
      required this.unit,
      required this.amount,
      required this.name});

  factory Ingredient.fromMap(Map<String, dynamic> json) => Ingredient(
      unit: json["unit"],
      amount: json["amount"],
      name: json["name"],
      imageUrl: json["imageUrl"]);

  Map<String, dynamic> toMap() =>
      {"unit": unit, "amount": amount, "name": name, "imageUrl": imageUrl};

  Ingredient ingredientsFromJson(String str) =>
      Ingredient.fromMap(json.decode(str));

  String ingredientToJson(Ingredient data) => json.encode(data.toMap());
}
