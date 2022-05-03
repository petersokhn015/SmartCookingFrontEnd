import 'package:app/Models/Recipe.dart';
import 'package:app/Providers/FavoritesProvider.dart';
import 'package:app/Services/RecipeService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeProvider extends ChangeNotifier {
  RecipeServices recipeServices = RecipeServices();
  List<Recipe> recommendedRecipes = [];
  List<Recipe> currentRecipes = [];

  HomeProvider() {
    setCurrentRecipes();
  }

  setRecommendedRecipes(List<Recipe> favorites) {
    if (favorites.isEmpty) {
      getRandomRecipes().then((value) {
        recommendedRecipes = value;
        notifyListeners();
      });
    } else {
      getRecommendedRecipes(favorites).then((value) {
        recommendedRecipes = value;
        notifyListeners();
      });
    }
  }

  setCurrentRecipes() {
    getCurrentRecipes().then((value) {
      currentRecipes = value;
      notifyListeners();
    });
  }

  Future<List<Recipe>> getRandomRecipes() async {
    return await recipeServices.getRandomRecipes();
  }

  Future<List<Recipe>> getRecommendedRecipes(List<Recipe> favorites) async {
    return await recipeServices.getRecommendedRecipes(favorites);
  }

  Future<List<Recipe>> getCurrentRecipes() async {
    return await recipeServices.getRecipeByTime();
  }
}
