import 'package:app/Models/Recipe.dart';
import 'package:app/Services/Service.dart';
import 'package:app/Utils/AppColors.dart';
import 'package:app/Utils/Strings.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Row(
            children: [
              SafeArea(
                child: Stack(children: <Widget>[
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
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Recommended for you',
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ],
          ),
          Row(children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    child: Text(
                      'How are you feeling?',
                      style: TextStyle(fontWeight: FontWeight.w900),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 8,
                  child: Text(
                    'What you might currently want',
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Browse',
                        style: TextStyle(color: mainColorTheme, fontSize: 11),
                      )),
                )
              ],
            ),
          ),
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
                              imageURL: snapshot.data![index].imageURL,
                              recipeName: snapshot.data![index].name,
                              ingredientCount:
                                  snapshot.data![index].ingredientCount);
                        },
                      );
                    } else {
                      return Text('Something when wrong');
                    }
                  })),
        ],
      ),
    );
  }
}
