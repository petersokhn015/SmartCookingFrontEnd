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
      tags: json["tags"],
      ingredients: json["ingredients"],
      steps: json["steps"]);

  Map<String, dynamic> toMap() => {
        "id": id,
        "image": image,
        "title": title,
        "cookTime": cookTime,
        "caloriesAmount": caloriesAmount,
        "servings": servings,
        "ingedientCount": ingredientCount,
        "tags": tags,
        "ingredents": ingredients,
        "steps": steps
      };
}
