import 'package:app/Models/DetailedRecipe.dart';
import 'package:app/Services/Service.dart';
import 'package:app/Utils/Strings.dart';
import 'package:app/Widgets/LoadingScreen.dart';
import 'package:app/Utils/AppColors.dart';
import 'package:app/Widgets/ApplicationBar.dart';
import 'package:flutter/material.dart';

class RecipeDetails extends StatefulWidget {
  final int recipeId;
  const RecipeDetails({
    Key? key,
    required this.recipeId,
  }) : super(key: key);

  @override
  State<RecipeDetails> createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {
  DetailedRecipe? recipeDetails;

  @override
  Widget build(BuildContext context) {
    getInfo();
    return recipeDetails == null
        ? LoadingScreen()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: primaryColor,
              centerTitle: true,
              title: Text("Recipe Details"),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(clipBehavior: Clip.none, children: [
                    //background
                    Container(
                      color: primaryColor,
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width,
                    ),
                    //recipe image
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width - 25,
                        height: MediaQuery.of(context).size.height / 1.9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                            image: DecorationImage(
                              image: NetworkImage(recipeDetails!.imageUrl),
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                    //recipe details box
                    Positioned(
                      left: 25,
                      top: MediaQuery.of(context).size.height / 2.3,
                      child: Container(
                        width: MediaQuery.of(context).size.width - 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: secondaryColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        //recipe details info
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            //name
                            children: [
                              Text(
                                recipeDetails!.name,
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w900),
                              ),
                              SizedBox(height: 15),
                              //ingredients count
                              Text(
                                recipeDetails!.ingredientCount == 1
                                    ? recipeDetails!.ingredientCount
                                            .toString() +
                                        ' ingredient'
                                    : recipeDetails!.ingredientCount
                                            .toString() +
                                        ' ingredients',
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              //extra recipe info
                              Row(
                                children: [
                                  //cook time
                                  Expanded(
                                    child: Text.rich(
                                      TextSpan(children: [
                                        WidgetSpan(
                                            child: Tab(
                                              icon:
                                                  new Image.asset(cookTimeIcon),
                                            ),
                                            alignment:
                                                PlaceholderAlignment.middle),
                                        TextSpan(
                                            text: " " +
                                                recipeDetails!.cookTime
                                                    .toString() +
                                                ' min')
                                      ]),
                                      textAlign: TextAlign.center,
                                    ),
                                    flex: 1,
                                  ),
                                  //calories count
                                  Expanded(
                                    child: Text.rich(
                                      TextSpan(children: [
                                        WidgetSpan(
                                            child: Tab(
                                              icon:
                                                  new Image.asset(caloriesIcon),
                                            ),
                                            alignment:
                                                PlaceholderAlignment.middle),
                                        TextSpan(
                                            text: " " +
                                                recipeDetails!.calorieAmount
                                                    .toString() +
                                                ' kcal')
                                      ]),
                                      textAlign: TextAlign.center,
                                    ),
                                    flex: 1,
                                  ),
                                  //servings count
                                  Expanded(
                                    child: Text.rich(
                                      TextSpan(children: [
                                        WidgetSpan(
                                            child: Tab(
                                              icon:
                                                  new Image.asset(servingsIcon),
                                            ),
                                            alignment:
                                                PlaceholderAlignment.middle),
                                        TextSpan(
                                          text: recipeDetails!.servingAmount ==
                                                  1
                                              ? " " +
                                                  recipeDetails!.servingAmount
                                                      .toString() +
                                                  ' serving'
                                              : " " +
                                                  recipeDetails!.servingAmount
                                                      .toString() +
                                                  ' servings',
                                        )
                                      ]),
                                      textAlign: TextAlign.center,
                                    ),
                                    flex: 1,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
                  // ListView(
                  //   scrollDirection: Axis.horizontal,
                  //   shrinkWrap: true,
                  // )
                ],
              ),
            ),
          );
  }

// get recipe info by id
  void getInfo() {
    getRecipeDetails(widget.recipeId)
        .then((value) => {setState(() => recipeDetails = value)});
  }
}
