import 'package:app/Providers/FavoritesProvider.dart';
import 'package:app/Utils/AppColors.dart';
import 'package:app/Widgets/BackToTop.dart';
import 'package:app/Widgets/RecipesGrid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favorite extends StatelessWidget {
  Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          centerTitle: true,
          title: Text("Favourites"),
        ),
        body: !Provider.of<FavoriteProvider>(context).favorites.isEmpty
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: BackToTop(
                  child: RecipesGrid(
                      recipes:
                          Provider.of<FavoriteProvider>(context).favorites),
                ),
              )
            : Center(child: Text("No Favorites Found")));
  }
}
