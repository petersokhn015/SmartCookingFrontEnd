import 'package:app/Models/Recipe.dart';
import 'package:app/Widgets/RecipeCard.dart';
import 'package:flutter/material.dart';

List<Recipe> recipes = [
  Recipe(
      id: 1,
      name: 'Bamboo Salad',
      imageURL: 'https://spoonacular.com/recipeImages/715538-312x231.jpg',
      ingredientCount: 3),
  Recipe(
      id: 2,
      name: 'Bamboo Salad',
      imageURL: 'https://spoonacular.com/recipeImages/715538-312x231.jpg',
      ingredientCount: 1),
  Recipe(
      id: 4,
      name: 'Bamboo Salad',
      imageURL: 'https://spoonacular.com/recipeImages/715538-312x231.jpg',
      ingredientCount: 4)
];

List<String> tags = ['Vegan', 'American', 'Gluten Free'];

Future<List<Recipe>> getRecipes() async {
  return await recipes;
}

Future<List<String>> getTags() async {
  return await tags;
}

Future<List<Widget>> getRecommendations() async {
  List<Widget> recipesList = [];
  for (int i = 0; i < 3; i++) {
    recipesList.add(RecipeCard(
        imageURL: recipes[i].imageURL,
        recipeName: recipes[i].name,
        ingredientCount: recipes[i].ingredientCount));
  }
  return recipesList;
}
