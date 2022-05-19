import 'dart:io';
import 'dart:math';
import 'package:app/Models/DetailedRecipe.dart';
import 'package:app/Models/Recipe.dart';

import 'package:app/Utils/AppSettings.dart';
import 'package:dio/dio.dart';

class RecipeServices {
  Dio _dio = Dio();

  Future<List<Recipe>> getRecommendedRecipes(List<Recipe> favorites) async {
    List<Recipe> recipes = [];
    List<Recipe> temp = [];
    Random random = Random();
    List<int> ids = [];

    temp = favorites;
    if (temp.length > 3) {
      for (int i = 0; i < 3; i++) {
        int j = random.nextInt(temp.length);
        ids.add(temp[j].id);
      }
    } else {
      for (int i = 0; i < temp.length; i++) {
        ids.add(temp[i].id);
      }
    }

    try {
      Response response =
          await _dio.post(RecipeEndpoint + "/RecommendedRecipe", data: ids);

      if (response.statusCode == 200) {
        var data = response.data as List;
        recipes = data.map<Recipe>((e) => Recipe.fromMap(e)).toList();
      }
    } catch (e) {
      print(e);
    }
    return recipes;
  }

  Future<List<Recipe>> getRandomRecipes() async {
    List<Recipe> recipes = [];
    try {
      Response response = await _dio.get(RecipeEndpoint + "/RandomRecipes");

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
      Response response = await _dio.post(
        RecipeEndpoint + "/RecipeByIngredient",
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
        data: ingredients,
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

  Future<List<Recipe>> getRecipeByTime() async {
    List<Recipe> recipes = [];
    String tag = "";
    DateTime now = DateTime.now();

    try {
      final current = DateTime.parse(now.toString());
      int time = current.hour;
      if (time >= 4 && time < 11) {
        tag = "breakfast";
      } else if (time >= 11 && time < 15) {
        tag = "main course";
      } else if (time >= 15 && time < 19) {
        tag = "dessert";
      } else if (time >= 20 && time < 4) {
        tag = "dinner";
      }
      Response response =
          await _dio.get(RecipeEndpoint + "/RecipeByTime?tag=" + tag);

      if (response.statusCode == 200) {
        var data = response.data as List;
        recipes = data.map<Recipe>((e) => Recipe.fromMap(e)).toList();
      }
    } catch (e) {
      print(e);
    }
    return recipes;
  }
}
