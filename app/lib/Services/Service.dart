import 'package:app/Models/Recipe.dart';

List<Recipe> recipes = [
  Recipe(
      id: 1,
      name: 'Bamboo Salad',
      imageURL: 'https://spoonacular.com/recipeImages/715538-312x231.jpg',
      ingredientCount: 3),
  Recipe(
      id: 2,
      name: 'Bamboo Salad',
      imageURL: 'https://spoonacular.com/recipeImages/715538-312x231.jpg',
      ingredientCount: 1),
  Recipe(
      id: 4,
      name: 'Bamboo Salad',
      imageURL: 'https://spoonacular.com/recipeImages/715538-312x231.jpg',
      ingredientCount: 4)
];

List<String> tags = ['Vegan', 'American', 'Main Course'];

Future<List<Recipe>> getRecipes() async {
  return await recipes;
}

Future<List<String>> getTags() async {
  return await tags;
}
