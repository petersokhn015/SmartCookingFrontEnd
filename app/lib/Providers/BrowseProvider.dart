import 'package:app/Models/Recipe.dart';
import 'package:app/Services/RecipeService.dart';
import 'package:flutter/material.dart';

class BrowseProvider extends ChangeNotifier {
  List<Recipe> browseRecipes = [];
  RecipeServices recipeServices = RecipeServices();

  setBrowseRecipes(List<String> ingredientList) {
    getRecipes(ingredientList).then((value) {
      browseRecipes = value;
      notifyListeners();
    });
  }

  Future<List<Recipe>> getRecipes(List<String> ingredientList) async {
    return await recipeServices.getRecipesByIngredients(ingredientList);
  }
}
