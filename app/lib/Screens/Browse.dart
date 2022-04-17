import 'package:app/Utils/AppColors.dart';
import 'package:app/Utils/Strings.dart';
import 'package:app/Widgets/FilterOverlay.dart';
import 'package:app/Widgets/RecipeCard.dart';
import 'package:flutter/material.dart';
import 'package:app/Models/Recipe.dart';

class Browse extends StatefulWidget {
  late List<Recipe> recipeList;
  Browse({
    Key? key,
    required this.recipeList,
  }) : super(key: key);

  @override
  State<Browse> createState() => _BrowseState();
}

class _BrowseState extends State<Browse> with TickerProviderStateMixin {
  late OverlayState? overlayState;
  late OverlayEntry overlayEntry;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
        child: GridView.builder(
            shrinkWrap: true,
            itemCount: widget.recipeList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 2.0, mainAxisSpacing: 2.0),
            itemBuilder: (BuildContext context, int index) {
              return RecipeCard(recipe: widget.recipeList[index]);
            }),
      ),
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

  removeFilter() {
    overlayEntry.remove();
  }
}
