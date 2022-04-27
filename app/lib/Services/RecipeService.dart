import 'package:app/Models/DetailedRecipe.dart';
import 'package:app/Models/Recipe.dart';

import 'package:app/Utils/AppSettings.dart';
import 'package:dio/dio.dart';

class RecipeServices {
  Dio dio = Dio();

  Future<List<Recipe>> getRandomRecipes(int recipeCount) async {
    List<Recipe> recipes = [];
    try {
      Response response = await dio.get(RecipeEndpoint +
          "RandomRecipes?recipeCount=" +
          recipeCount.toString());
      var data = response.data as List;
      recipes = data.map<Recipe>((e) => Recipe.fromMap(e)).toList();
    } catch (e) {
      print(e);
    }
    return recipes;
  }

  Future<DetailedRecipe?> getDetailedRecipe(int recipeId) async {
    try {
      Response response = await dio.get(
          RecipeEndpoint + "RecipeDetails?recipeId=" + recipeId.toString());
      DetailedRecipe recipe = DetailedRecipe.fromMap(response.data);
      return recipe;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
