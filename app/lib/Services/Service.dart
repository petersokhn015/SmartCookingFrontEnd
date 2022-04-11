import 'package:app/Models/DetailedRecipe.dart';
import 'package:app/Models/Ingredient.dart';
import 'package:app/Models/Recipe.dart';

Future<List<Recipe>> getRecipes() async {
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
  return await recipes;
}

Future<List<String>> getTags() async {
  List<String> tags = ['Vegan', 'American', 'Main Course'];
  return await tags;
}

Future<DetailedRecipe> getRecipeDetails(int id) async {
  List<String> tags = [
    'Vegan',
    'Gluten Free',
    'American',
    'Main Course',
    "Vegetarian"
  ];
  List<String> instructions = ['Cut Bamboo', 'Add Salt'];
  List<Ingredient> ingredients = [
    new Ingredient(
        unit: 'g',
        amount: 3,
        name: 'bamboo',
        imageUrl:
            'https://cpimg.tistatic.com/04933164/b/4/Bambo-Extract-70-Silica.jpg'),
    new Ingredient(
        unit: 'tbs',
        amount: 1,
        name: 'salt',
        imageUrl:
            'https://jabalchannel.com/wp-content/uploads/2019/08/SALT.jpg')
  ];

  List<String> steps = ['Burn oven', 'Add salt'];

  return await new DetailedRecipe(
      imageUrl: "https://spoonacular.com/recipeImages/715538-312x231.jpg",
      name: 'Bamboo Salad',
      cookTime: 45,
      tags: tags,
      ingredients: ingredients,
      calorieAmount: 12,
      ingredientCount: ingredients.length,
      servingAmount: 2,
      instructions: instructions,
      steps: steps);
}
