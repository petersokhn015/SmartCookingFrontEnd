import 'dart:convert';
import 'dart:math';

import 'package:app/Models/Ingredient.dart';

class DetailedRecipe {
  final int id;
  final String image, title;
  final int cookTime, caloriesAmount, servings, ingredientCount;
  final List<String> tags;
  final List<Ingredient> ingredients;
  final List<String> steps;

  DetailedRecipe(
      {required this.id,
      required this.image,
      required this.title,
      required this.cookTime,
      required this.caloriesAmount,
      required this.servings,
      required this.ingredientCount,
      required this.tags,
      required this.ingredients,
      required this.steps});

  factory DetailedRecipe.fromMap(Map<String, dynamic> json) => DetailedRecipe(
      id: json["id"],
      image: json["image"],
      title: json["title"],
      cookTime: json["cookTime"],
      caloriesAmount: json["caloriesAmount"],
      servings: json["servings"],
      ingredientCount: json["ingredientCount"],
      tags: List<String>.from(json["tags"]),
      ingredients: json["ingredients"]
          .map<Ingredient>((e) => Ingredient.fromMap(e))
          .toList(),
      steps: List<String>.from(json["steps"]));

  Map<String, dynamic> toMap() => {
        "id": id,
        "image": image,
        "title": title,
        "cookTime": cookTime,
        "caloriesAmount": caloriesAmount,
        "servings": servings,
        "ingedientCount": ingredientCount,
        "tags": tags,
        "ingredents":
            ingredients.map<String>((e) => e.ingredientToJson(e)).toList(),
        "steps": steps
      };

  DetailedRecipe detailedRecipeFromJson(String str) =>
      DetailedRecipe.fromMap(json.decode(str));

  String detailedRecipeToJson(DetailedRecipe data) => json.encode(data.toMap());
}
