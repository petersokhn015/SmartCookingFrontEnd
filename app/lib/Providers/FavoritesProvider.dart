import 'package:app/Models/DetailedRecipe.dart';
import 'package:app/Models/Recipe.dart';
import 'package:app/Services/FavoriteServices.dart';
import 'package:app/Services/UserServices.dart';
import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  FavoriteServices favoriteServices = FavoriteServices();
  UserServices userServices = UserServices();
  List<Recipe> favorites = [];
  bool isFavorite;

  FavoriteProvider({
    this.isFavorite = false,
  });

  setFavorites(int recipeId) {
    getAllFavorites(recipeId).then((value) {
      favorites = value;
      notifyListeners();
    });
  }

  addFavorite(int userId, DetailedRecipe detailedRecipe) {
    favoriteServices.addFavorite(userId, detailedRecipe).then((value) {
      if (value) {
        favorites.add(Recipe(
            id: detailedRecipe.id,
            title: detailedRecipe.title,
            image: detailedRecipe.image));
        isFavorite = true;
      }

      notifyListeners();
    });
  }

  removeFavorite(int userId, int recipeId) {
    favoriteServices.removeFavorite(userId, recipeId).then((value) {
      if (value) {
        favorites.removeWhere(((element) => element.id == recipeId));
        isFavorite = false;
        notifyListeners();
      }
    });
  }

  Future<List<Recipe>> getAllFavorites(int userId) async {
    return await favoriteServices.getFavoriteRecipes(userId);
  }

  checkIfIsFavorite(int recipeId) {
    for (var favorite in favorites) {
      if (favorite.id == recipeId) {
        isFavorite = true;
        return true;
      }
    }
    isFavorite = false;
    return false;
  }
}
