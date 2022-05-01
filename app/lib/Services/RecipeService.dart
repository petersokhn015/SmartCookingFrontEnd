import 'dart:convert';
import 'dart:io';

import 'package:app/Models/DetailedRecipe.dart';
import 'package:app/Models/Recipe.dart';

import 'package:app/Utils/AppSettings.dart';
import 'package:dio/dio.dart';

class RecipeServices {
  Dio _dio = Dio();

  Future<List<Recipe>> getRandomRecipes(int recipeCount) async {
    List<Recipe> recipes = [];
    try {
      Response response = await _dio.get(RecipeEndpoint +
          "/RandomRecipes?recipeCount=" +
          recipeCount.toString());

      if (response.statusCode == 200) {
        var data = response.data as List;
        recipes = data.map<Recipe>((e) => Recipe.fromMap(e)).toList();
      }
    } catch (e) {
      print(e);
    }
    return recipes;
  }

  Future<DetailedRecipe?> getDetailedRecipe(int recipeId) async {
    try {
      Response response = await _dio.get(
          RecipeEndpoint + "/RecipeDetails?recipeId=" + recipeId.toString());

      if (response.statusCode == 200) {
        DetailedRecipe recipe = DetailedRecipe.fromMap(response.data);
        return recipe;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<Recipe>> getRecipesByIngredients(List<String> ingredients) async {
    List<Recipe> recipes = [];
    try {
      String ingredient = '';
      for (var element in ingredients) {
        ingredient += element + " ";
      }

      Response response = await _dio.post(
        RecipeEndpoint + "/RecipeByIngredient",
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
        data: [ingredient],
      );

      if (response.statusCode == 200) {
        var data = response.data as List;
        recipes = data.map<Recipe>((e) => Recipe.fromMap(e)).toList();
      }
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
