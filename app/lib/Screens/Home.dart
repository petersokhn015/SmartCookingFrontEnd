import 'package:app/Utils/AppColors.dart';
import 'package:app/Utils/Strings.dart';
import 'package:app/Widgets/RecipeCard.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      Row(children: [
        SafeArea(
          child: Stack(children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: FittedBox(
                child: Image.asset(
                  homePageTopShape,
                ),
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Welcome Back \n joteif",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.center),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 3.5,
                        height: MediaQuery.of(context).size.width / 3.5,
                        child: Image.asset(chefPandaLogo),
                      )
                    ],
                  )),
            ),
          ]),
        )
      ]),
      SizedBox(
        height: 20.0,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'What you might currently want',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            SizedBox(width: 25),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Browse',
                  style: TextStyle(color: mainColorTheme, fontSize: 11),
                ))
          ],
        ),
      ),
      Container(
        height: MediaQuery.of(context).size.height / 4,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            RecipeCard(
                imageURL:
                    'https://spoonacular.com/recipeImages/715538-312x231.jpg',
                recipeName: 'name',
                ingredientCount: 3),
            RecipeCard(
                imageURL:
                    'https://spoonacular.com/recipeImages/715538-312x231.jpg',
                recipeName: 'name',
                ingredientCount: 3),
            RecipeCard(
                imageURL:
                    'https://spoonacular.com/recipeImages/715538-312x231.jpg',
                recipeName: 'name',
                ingredientCount: 3),
            RecipeCard(
                imageURL:
                    'https://spoonacular.com/recipeImages/715538-312x231.jpg',
                recipeName: 'name',
                ingredientCount: 3)
          ],
        ),
      )
    ]));
  }
}
