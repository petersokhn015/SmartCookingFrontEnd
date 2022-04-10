import 'package:app/Models/Ingredient.dart';

class DetailedRecipe {
  final String imageUrl, name;
  final int cookTime, calorieAmount, servingAmount, ingredientCount;
  final List<String> tags, instructions;
  final List<Ingredient> ingredients;

  DetailedRecipe(
      {required this.imageUrl,
      required this.name,
      required this.cookTime,
      required this.calorieAmount,
      required this.servingAmount,
      required this.ingredientCount,
      required this.tags,
      required this.ingredients,
      required this.instructions});

  factory DetailedRecipe.fromMap(Map<String, dynamic> json) => DetailedRecipe(
      imageUrl: json["imageUrl"],
      name: json["name"],
      cookTime: json["cookTime"],
      calorieAmount: json["calorieAmount"],
      servingAmount: json["servingAmount"],
      ingredientCount: json["ingredientCount"],
      tags: json["tags"],
      ingredients: json["ingredients"],
      instructions: json["instructions"]);

  Map<String, dynamic> toMap() => {
        "imageUrl": imageUrl,
        "name": name,
        "cookTime": cookTime,
        "calorieAmount": calorieAmount,
        "servingAmount": servingAmount,
        "ingedientCount": ingredientCount,
        "tags": tags,
        "ingredents": ingredients,
        "instructions": instructions
      };
}
