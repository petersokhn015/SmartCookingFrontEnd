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
    getRecommendedRecipes().then((value) {
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

  Future<List<Recipe>> getRecommendedRecipes() async {
    return await recipeServices.getRandomRecipes();
  }

  Future<List<Recipe>> getAllRecipes2() async {
    return await recipeServices.getRandomRecipes();
  }
}
