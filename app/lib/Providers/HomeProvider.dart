import 'package:app/Models/Recipe.dart';
import 'package:app/Services/RecipeService.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  RecipeServices recipeServices = RecipeServices();
  List<Recipe> recommendedRecipes = [];
  List<Recipe> currentRecipes = [];

  HomeProvider() {
    setRecommendedRecipes();
    setCurrentRecipes();
  }

  setRecommendedRecipes() {
    getAllRecipes().then((value) {
      recommendedRecipes = value;
      notifyListeners();
    });
  }

  setCurrentRecipes() {
    getAllRecipes2().then((value) {
      currentRecipes = value;
      notifyListeners();
    });
  }

  Future<List<Recipe>> getAllRecipes() async {
    return await recipeServices.getRandomRecipes(3);
  }

  Future<List<Recipe>> getAllRecipes2() async {
    return await recipeServices.getRandomRecipes(5);
  }
}
