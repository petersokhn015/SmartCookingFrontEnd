import 'package:app/Models/Ingredient.dart';

class DetailedRecipe {
  final int id;
  final String imageUrl, title;
  final int cookTime, calorieAmount, servingAmount, ingredientCount;
  final List<String> tags;
  final List<Ingredient> ingredients;
  final List<String> steps;

  DetailedRecipe(
      {required this.id,
      required this.imageUrl,
      required this.title,
      required this.cookTime,
      required this.calorieAmount,
      required this.servingAmount,
      required this.ingredientCount,
      required this.tags,
      required this.ingredients,
      required this.steps});

  factory DetailedRecipe.fromMap(Map<String, dynamic> json) => DetailedRecipe(
      id: json["id"],
      imageUrl: json["imageUrl"],
      title: json["title"],
      cookTime: json["cookTime"],
      calorieAmount: json["calorieAmount"],
      servingAmount: json["servingAmount"],
      ingredientCount: json["ingredientCount"],
      tags: json["tags"],
      ingredients: json["ingredients"],
      steps: json["steps"]);

  Map<String, dynamic> toMap() => {
        "id": id,
        "imageUrl": imageUrl,
        "title": title,
        "cookTime": cookTime,
        "calorieAmount": calorieAmount,
        "servingAmount": servingAmount,
        "ingedientCount": ingredientCount,
        "tags": tags,
        "ingredents": ingredients,
        "steps": steps
      };
}
