import 'package:app/Models/Filter.dart';
import 'package:app/Models/Recipe.dart';
import 'package:app/Services/RecipeService.dart';
import 'package:flutter/material.dart';

class BrowseProvider extends ChangeNotifier {
  List<Recipe> browseRecipes = [];
  RecipeServices recipeServices = RecipeServices();
  late Filter browseFilter;

  Map<String, bool> diet = {
    'Vegan': true,
    'Ketogenic': false,
    'Gluten Free': true,
    'Pescetarian': false,
    'Vegetarian': true,
  };

  Map<String, bool> intolerence = {
    'Eggs': true,
    'Dairy': false,
    'Gluten': false,
    'Peanut': false,
    'Sesame': false,
  };

  Map<String, bool> mealType = {
    'Breakfast': false,
    'Dessert': false,
    'Appetizer': false,
    'Main Course': false,
    'Side Dish': true,
  };

  Map<String, bool> cuisineType = {
    'American': true,
    'African': false,
    'Japanese': false,
    'Mexican': false,
    'Nordic': true
  };

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
