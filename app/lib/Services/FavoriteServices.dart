import 'dart:io';

import 'package:app/Models/DetailedRecipe.dart';
import 'package:app/Models/Recipe.dart';
import 'package:app/Utils/AppSettings.dart';
import 'package:dio/dio.dart';

class FavoriteServices {
  Dio _dio = Dio();

  Future<List<Recipe>> getFavoriteRecipes(int userId) async {
    List<Recipe> recipes = [];
    try {
      Response response = await _dio
          .get(FavoriteEndpoint + "Favourite?userId=" + userId.toString());

      if (response.statusCode == 200) {
        var data = response.data as List;
        recipes = data.map<Recipe>((e) => Recipe.fromMap(e)).toList();
      }
    } catch (e) {
      print(e);
    }
    return recipes;
  }

  Future<bool> addFavorite(int userId, DetailedRecipe detailedRecipe) async {
    try {
      Response response = await _dio.post(
          FavoriteEndpoint + "Favourite?userId=" + userId.toString(),
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }),
          data: detailedRecipe.detailedRecipeToJson(detailedRecipe));

      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> removeFavorite(int userId, int recipeId) async {
    Response response = await _dio.delete(FavoriteEndpoint +
        "Favourite?recipeId=" +
        recipeId.toString() +
        "&userId=" +
        userId.toString());
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
