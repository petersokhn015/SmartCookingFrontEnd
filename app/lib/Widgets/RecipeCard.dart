import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final String recipeName, imageURL;
  final int ingredientCount;
  RecipeCard(
      {required this.imageURL,
      required this.recipeName,
      required this.ingredientCount});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 11, vertical: 10),
      width: 130,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.25),
            BlendMode.multiply,
          ),
          image: NetworkImage(imageURL),
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
                        recipeName,
                        style: TextStyle(fontSize: 10, color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        ingredientCount == 1
                            ? '$ingredientCount ingredient'
                            : '$ingredientCount ingredients',
                        style: TextStyle(fontSize: 10, color: Colors.white),
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
    );
  }
}
