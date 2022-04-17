import 'package:app/Models/DetailedRecipe.dart';
import 'package:app/Services/Service.dart';
import 'package:app/Utils/Strings.dart';
import 'package:app/Widgets/BackToTop.dart';
import 'package:app/Widgets/IngredientsList.dart';
import 'package:app/Widgets/InstructionsList.dart';
import 'package:app/Widgets/LoadingScreen.dart';
import 'package:app/Utils/AppColors.dart';
import 'package:app/Widgets/Tag.dart';
import 'package:app/Widgets/TagsList.dart';
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
  List<Tag> tagsList = [];

  @override
  Widget build(BuildContext context) {
    getInfo();
    if (tagsList.isEmpty)
      setState(() {
        tagsList = generateTags(recipeDetails!.tags);
      });
    return recipeDetails == null
        ? LoadingScreen()
        : SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: primaryColor,
                centerTitle: true,
                title: Text("Recipe Details"),
              ),
              body: BackToTop(
                widget: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                              color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Color(0xFF303030)
                                  : secondaryColor),
                              boxShadow: [
                                Theme.of(context).brightness == Brightness.dark
                                    ? BoxShadow(
                                        color: secondaryColor.withOpacity(0.2),
                                        blurRadius: 7,
                                        offset: Offset(0, 3),
                                      )
                                    : BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        blurRadius: 2,
                                        offset: Offset(0, 3),
                                      ),
                              ],
                            ),
                            //recipe details info
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                //name
                                children: [
                                  Text(
                                    recipeDetails!.name,
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w900),
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
                                                  icon: new Image.asset(
                                                      cookTimeIcon),
                                                ),
                                                alignment: PlaceholderAlignment
                                                    .middle),
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
                                                  icon: new Image.asset(
                                                      caloriesIcon),
                                                ),
                                                alignment: PlaceholderAlignment
                                                    .middle),
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
                                                  icon: new Image.asset(
                                                      servingsIcon),
                                                ),
                                                alignment: PlaceholderAlignment
                                                    .middle),
                                            TextSpan(
                                              text: recipeDetails!
                                                          .servingAmount ==
                                                      1
                                                  ? " " +
                                                      recipeDetails!
                                                          .servingAmount
                                                          .toString() +
                                                      ' serving'
                                                  : " " +
                                                      recipeDetails!
                                                          .servingAmount
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
                      //tags list
                      Center(
                        child: Padding(
                            padding: EdgeInsets.only(top: 80),
                            child: TagsList(tags: tagsList)),
                      ),

                      //ingredients list
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                'Ingredients',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 24),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                height: MediaQuery.of(context).size.height / 4,
                                child: IngredientsList(
                                    ingredients: recipeDetails!.ingredients),
                              ),
                            )
                          ]),
                      //Instructions
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                'Instructions',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 24),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Container(
                                  width: MediaQuery.of(context).size.width - 25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: primaryColor,
                                  ),
                                  child: InstructionsList(
                                      steps: recipeDetails!.steps)),
                            ),
                            SizedBox(
                              height: 30,
                            )
                          ]),
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  // get recipe info by id
  void getInfo() {
    getRecipeDetails(widget.recipeId)
        .then((value) => {setState(() => recipeDetails = value)});
  }

  //generate tags list
  List<Tag> generateTags(List<String> tags) {
    List<Tag> tagsList = [];
    for (var i = 0; i < tags.length; i++) {
      tagsList.add(Tag(
        text: tags[i],
        isActive: true,
        isPressable: true,
        voidCallback: () {},
      ));
    }
    return tagsList;
  }
}
