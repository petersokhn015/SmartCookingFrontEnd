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
      for (var d in response.data) {
        recipes.add(d);
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
