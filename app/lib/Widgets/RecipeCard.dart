import 'package:app/Models/Recipe.dart';
import 'package:app/Screens/RecipeDetails.dart';
import 'package:app/Utils/AppColors.dart';
import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final double width, height;

  RecipeCard({required this.recipe, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => changPages(recipe.id, context)),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 11, vertical: 10),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.25),
              BlendMode.multiply,
            ),
            image: NetworkImage(recipe.imageURL),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          recipe.name,
                          style: TextStyle(fontSize: 14, color: secondaryColor),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          recipe.ingredientCount == 1
                              ? recipe.ingredientCount.toString() +
                                  ' ingredient'
                              : recipe.ingredientCount.toString() +
                                  ' ingredients',
                          style: TextStyle(fontSize: 14, color: secondaryColor),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              alignment: Alignment.bottomLeft,
            ),
          ],
        ),
      ),
    );
  }

  void changPages(int recipeId, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => RecipeDetails(
                recipeId: recipeId,
              )),
    );
  }
}
