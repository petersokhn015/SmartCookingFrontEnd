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

  Future<List<Recipe>> getRecipesByIngredients(List<String> ingredients) async {
    List<Recipe> recipes = [];
    try {
      int i = 0;
      String ingredient = '';
      for (var element in ingredients) {
        if (i >= ingredients.length) {
          ingredient += "ingredients=" + element;
        }
        ingredient += "ingredients=" + element + "&";
        i++;
      }

      Response response = await _dio.get(RecipeEndpoint + ingredient);
      var data = response.data as List;

    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return recipes;
  }
}
