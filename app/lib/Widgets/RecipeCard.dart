import 'package:app/Models/Recipe.dart';
import 'package:app/Screens/RecipeDetails.dart';
import 'package:app/Utils/AppColors.dart';
import 'package:app/Utils/Strings.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final double width;
  final double height;

  RecipeCard({required this.recipe, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => changPages(recipe.id, context)),
      child: Stack(children: [
        ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            child: ShaderMask(
              shaderCallback: (bounds) {
                return LinearGradient(
                        colors: [Colors.transparent, tertiaryColor],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)
                    .createShader(bounds);
              },
              blendMode: BlendMode.srcATop,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 11, vertical: 10),
                width: width,
                height: height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                      colors: [secondaryColor, tertiaryColor],
                      stops: [0, 1],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        Image.asset(errorImage),
                    imageUrl: recipe.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: width - 20,
                          child: Text(
                            recipe.title,
                            style: TextStyle(
                                fontSize: 16,
                                color: secondaryColor,
                                fontWeight: FontWeight.w500),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
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
      ]),
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
