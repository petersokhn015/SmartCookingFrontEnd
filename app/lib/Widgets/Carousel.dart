import 'package:app/Models/Recipe.dart';
import 'package:app/Utils/AppColors.dart';
import 'package:app/Widgets/LoadingCard.dart';
import 'package:app/Widgets/RecipeCard.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../Services/RecipeService.dart';

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int currentSlide = 0;
  final int recipeCount = 3;
  RecipeServices recipeServices = RecipeServices();
  final CarouselController controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FutureBuilder<List<Recipe>>(
            future: recipeServices.getRandomRecipes(recipeCount),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    CarouselSlider.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder:
                          (BuildContext context, int index, int realIndex) {
                        return RecipeCard(
                          recipe: snapshot.data![index],
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
                        children: snapshot.data!.asMap().entries.map((recipe) {
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
              }
              return LoadingCard(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
              );
            }),
      ],
    );
  }
}
