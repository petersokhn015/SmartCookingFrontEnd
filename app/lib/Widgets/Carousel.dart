import 'package:app/Models/Recipe.dart';
import 'package:app/Providers/HomeProvider.dart';
import 'package:app/Utils/AppColors.dart';
import 'package:app/Widgets/LoadingCard.dart';
import 'package:app/Widgets/RecipeCard.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int currentSlide = 0;
  late List<Recipe> recipes;
  final CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<HomeProvider>(context);
    return Consumer<HomeProvider>(builder: (context, cart, child) {
      return Column(
        children: <Widget>[
          Builder(builder: (context) {
            if (!recipeProvider.recommendedRecipes.isEmpty) {
              recipes = recipeProvider.recommendedRecipes;
              return Column(
                children: [
                  CarouselSlider.builder(
                    itemCount: recipes.length,
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      return RecipeCard(
                        recipe: recipes[index],
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2,
                      );
                    },
                    carouselController: controller,
                    options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: 0.8,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        aspectRatio: 1.25,
                        onPageChanged: (pageIndex, reason) {
                          setState(() {
                            currentSlide = pageIndex;
                          });
                        }),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: recipes.asMap().entries.map((recipe) {
                        return GestureDetector(
                            onTap: () => currentSlide = recipe.key,
                            child: Container(
                              width: 15,
                              height: 15,
                              margin: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 10),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? secondaryColor
                                          : primaryColor)
                                      .withOpacity(currentSlide == recipe.key
                                          ? 0.9
                                          : 0.3)),
                            ));
                      }).toList())
                ],
              );
            } else {
              return LoadingCard(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3);
            }
          })
        ],
      );
    });
  }
}
