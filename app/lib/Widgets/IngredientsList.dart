import 'package:app/Models/Ingredient.dart';
import 'package:app/Widgets/IngredientCard.dart';
import 'package:flutter/material.dart';

class IngredientsList extends StatelessWidget {
  final List<Ingredient> ingredients;
  const IngredientsList({
    Key? key,
    required this.ingredients,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: ingredients.length,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          width: 10,
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return IngredientCard(
          imageUrl: ingredients[index].imageUrl,
          name: ingredients[index].name,
          amount: ingredients[index].amount,
          unit: ingredients[index].unit,
        );
      },
    );
  }
}
