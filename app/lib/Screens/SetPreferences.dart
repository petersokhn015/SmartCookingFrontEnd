import 'package:app/Utils/AppColors.dart';
import 'package:app/Utils/Strings.dart';
import 'package:app/Widgets/DropdownContent.dart';
import 'package:app/Widgets/DropdownContentTile.dart';
import 'package:app/Widgets/FilterOverlay.dart';
import 'package:flutter/material.dart';

class SetPreferences extends StatefulWidget {
  const SetPreferences({Key? key}) : super(key: key);

  @override
  State<SetPreferences> createState() => _SetPreferencesState();
}

class _SetPreferencesState extends State<SetPreferences> {
  List<DropDownItem> dietItems = [
    DropDownItem(
        body: DropdownContentTile(tags: [
          "Vegan",
          "Ketogenic",
          "Gluten Free",
          "Pescetarian",
          "Vegetarian"
        ]),
        header: 'Diet',
        isExpended: false),
  ];
  List<DropDownItem> intoleranceItems = [
    DropDownItem(
        body: DropdownContentTile(
            tags: ["Egg", "Dairy", "Gluten", "Peanut", "Sesame"]),
        header: 'Intolerence',
        isExpended: false),
  ];
  List<DropDownItem> mealTypeItems = [
    DropDownItem(
        body: DropdownContentTile(tags: [
          "Breakfast",
          "Dessert",
          "Appetizer",
          "Main Course",
          "Side Dish"
        ]),
        header: 'Meal Type',
        isExpended: false),
  ];
  List<DropDownItem> cuisineTypeItems = [
    DropDownItem(
        body: DropdownContentTile(
            tags: ["American", "African", "Japanese", "Mexican", "Nordic"]),
        header: 'Cuisine Type',
        isExpended: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text("Set Preferences"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        color: changeBackgroundColor(context),
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  DropdownContent(items: dietItems),
                  SizedBox(
                    height: 20,
                  ),
                  DropdownContent(items: intoleranceItems),
                  SizedBox(
                    height: 20,
                  ),
                  DropdownContent(items: mealTypeItems),
                  SizedBox(
                    height: 20,
                  ),
                  DropdownContent(items: cuisineTypeItems),
                  SizedBox(
                    height: 20,
                  ),
                ]),
              ),
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        tooltip: lbl_Save,
        onPressed: () {},
        child: Icon(
          Icons.save,
          color: secondaryColor,
        ),
      ),
    );
  }
}
