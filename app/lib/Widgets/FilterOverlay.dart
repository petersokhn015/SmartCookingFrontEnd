import 'package:app/Services/RecipeService.dart';
import 'package:app/Utils/AppColors.dart';
import 'package:app/Widgets/DropdownContent.dart';
import 'package:app/Widgets/DropdownContentTile.dart';
import 'package:app/Widgets/Tag.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FilterOverlay extends StatefulWidget {
  final VoidCallback onSaveCallback, onCancelCallback;
  FilterOverlay({
    Key? key,
    required this.onSaveCallback,
    required this.onCancelCallback,
  }) : super(key: key);

  @override
  State<FilterOverlay> createState() => _FilterOverlayState();
}

class _FilterOverlayState extends State<FilterOverlay> {
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
  List<Tag> tagsList = [];
  @override
  Widget build(BuildContext context) {
    if (tagsList.isEmpty)
      setState(() {
        // getTags()
        //     .then((value) => setState(() => tagsList = generateTags(value)));
      });
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.75),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: changeBackgroundColor(context),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 175,
              child: Column(
                children: [
                  Container(
                    color: primaryColor,
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 10, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Filters',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                  color: secondaryColor),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.close),
                            color: secondaryColor,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.check),
                            color: secondaryColor,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Max Cook Time: ',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                color: changeTextColor(context)),
                          ),
                          flex: 3,
                        ),
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                          ),
                          flex: 1,
                        ),
                        Expanded(
                          child: Text(
                            'min',
                            style: TextStyle(color: changeTextColor(context)),
                          ),
                          flex: 1,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 50,
                    color: primaryColor,
                    height: 2,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                        padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Column(
                          children: [
                            DropdownContent(items: dietItems),
                            DropdownContent(items: intoleranceItems),
                            DropdownContent(items: mealTypeItems),
                            DropdownContent(items: cuisineTypeItems),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //generate tags list
  List<Tag> generateTags(List<String> tags) {
    List<Tag> tagsList = [];
    for (var i = 0; i < tags.length; i++) {
      tagsList.add(Tag(
        text: tags[i],
        isActive: false,
        isPressable: true,
        voidCallback: () {},
      ));
    }
    return tagsList;
  }
}

class DropDownItem {
  DropDownItem(
      {required this.isExpended, required this.body, required this.header});

  late bool isExpended;
  late Widget body;
  late String header;
}
