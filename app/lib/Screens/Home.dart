import 'package:app/Models/Recipe.dart';
import 'package:app/Services/Service.dart';
import 'package:app/Utils/AppColors.dart';
import 'package:app/Utils/Strings.dart';
import 'package:app/Widgets/Carousel.dart';
import 'package:app/Widgets/RecipeCard.dart';
import 'package:app/Widgets/TagsList.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //Top Image
              Row(
                children: [
                  Stack(children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 5.5,
                      child: FittedBox(
                        child: Image.asset(
                          homePageTopShape,
                        ),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    //Top Text
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
                                      color: secondaryColor,
                                      fontSize: 18,
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
                ],
              ),
              SizedBox(
                height: 40,
              ),
              //Recommendation
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Recommended for you',
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 18),
                      ),
                    ),
                  ),
                  Carousel()
                ],
              ),
              //Tags
              Row(children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        child: Text(
                          'How are you feeling?',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 18),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(children: <Widget>[
                      Container(
                          width: MediaQuery.of(context).size.width - 20,
                          margin: EdgeInsets.all(10),
                          child: TagsList())
                    ]),
                  ],
                )
              ]),
              //Current Recipes
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 8,
                      child: Text(
                        'What you might currently want',
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 18),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Browse',
                            style: TextStyle(color: primaryColor, fontSize: 13),
                          )),
                    )
                  ],
                ),
              ),
              //Recipes
              Container(
                  height: MediaQuery.of(context).size.height / 4,
                  child: FutureBuilder<List<Recipe>>(
                      future: getRecipes(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<Recipe>> snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data?.length,
                            itemBuilder: (BuildContext context, int index) {
                              return RecipeCard(
                                recipe: snapshot.data![index],
                                width: 150,
                                height: 200,
                              );
                            },
                          );
                        } else {
                          return Text('Something when wrong');
                        }
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
