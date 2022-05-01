import 'package:app/Services/RecipeService.dart';
import 'package:app/Utils/AppColors.dart';
import 'package:app/Utils/Strings.dart';
import 'package:app/Widgets/BackToTop.dart';
import 'package:app/Widgets/FilterOverlay.dart';
import 'package:app/Widgets/LoadingCard.dart';
import 'package:app/Widgets/LoadingGrid.dart';
import 'package:app/Widgets/RecipeCard.dart';
import 'package:app/Widgets/RecipesGrid.dart';
import 'package:flutter/material.dart';
import 'package:app/Models/Recipe.dart';

class Browse extends StatefulWidget {
  late List<String> ingredientList;
  Browse({
    Key? key,
    required this.ingredientList,
  }) : super(key: key);

  @override
  State<Browse> createState() => _BrowseState();
}

class _BrowseState extends State<Browse> {
  Future<List<Recipe>>? recipeList;
  RecipeServices recipeServices = RecipeServices();

  @override
  Widget build(BuildContext context) {
    if (recipeList == null)
      setState(() {
        recipeList = getRecipes();
      });

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: primaryColor,
              centerTitle: true,
              title: Text("Browse"),
            ),
            body: Column(children: [
              SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 30,
                height: 35,
                child: Row(children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Search...',
                          filled: true,
                          fillColor: changeBackgroundColor(context),
                          contentPadding: EdgeInsets.fromLTRB(15.0, 0, 0, 0),
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(25.0),
                            ),
                          )),
                      keyboardType: TextInputType.text,
                    ),
                    flex: 5,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: IconButton(
                      icon: ImageIcon(
                        AssetImage(filterIcon),
                        color: changeTextColor(context),
                        size: 24,
                      ),
                      onPressed: () {
                        displayFilter(context);
                      },
                    ),
                    flex: 1,
                  )
                ]),
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                  child: BackToTop(
                      child: FutureBuilder<List<Recipe>>(
                          future: recipeList,
                          builder: (context, snapshot) {
                            return snapshot.data != null
                                ? RecipesGrid(recipes: snapshot.data!)
                                : LoadingGrid();
                          })))
            ])));
  }

  displayFilter(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext bc) {
          return SizedBox(
              height: MediaQuery.of(context).size.height - 175,
              child: FilterOverlay(
                  onSaveCallback: () {}, onCancelCallback: () {}));
        });
  }

  Future<List<Recipe>> getRecipes() async {
    return await recipeServices.getRecipesByIngredients(widget.ingredientList);
  }
}
