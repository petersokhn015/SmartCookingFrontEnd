import 'package:app/Models/Recipe.dart';
import 'package:app/Services/Service.dart';
import 'package:app/Widgets/RecipeCard.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FutureBuilder<List<Recipe>>(
            future: getRecipes(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return CarouselSlider.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    return RecipeCard(
                      imageURL: snapshot.data![index].imageURL,
                      recipeName: snapshot.data![index].name,
                      ingredientCount: snapshot.data![index].ingredientCount,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                    );
                  },
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.9,
                    aspectRatio: 1.0,
                    initialPage: 0,
                  ),
                );
              }
              return Text('something went wronf');
            }),
      ],
    );
  }
}
