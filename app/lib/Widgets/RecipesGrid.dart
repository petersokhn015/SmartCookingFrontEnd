import 'package:app/Models/Recipe.dart';
import 'package:app/Widgets/RecipeCard.dart';
import 'package:flutter/material.dart';

class RecipesGrid extends StatelessWidget {
  RecipesGrid({Key? key, required this.recipes}) : super(key: key);
  late List<Recipe> recipes;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: recipes.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 2.0, mainAxisSpacing: 2.0),
        itemBuilder: (BuildContext context, int index) {
          return RecipeCard(
            recipe: recipes[index],
            width: 175,
            height: 200,
          );
        });
  }
}
