import 'package:app/Models/Preference.dart';
import 'package:app/Providers/PreferencesProvider.dart';
import 'package:app/Providers/UserProvider.dart';
import 'package:app/Screens/SetPreferences.dart';
import 'package:app/Services/PreferenceService.dart';
import 'package:app/Utils/AppColors.dart';
import 'package:app/Utils/Strings.dart';
import 'package:app/Widgets/ApplicationBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class myPreferences extends StatefulWidget {
  const myPreferences({Key? key}) : super(key: key);

  @override
  State<myPreferences> createState() => _myPreferencesState();
}

class _myPreferencesState extends State<myPreferences> {
  PreferenceService preferenceService = PreferenceService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: primaryColor,
            centerTitle: true,
            title: Text(
              "My Preferences",
              style: TextStyle(
                  color: secondaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )),
        body:
            Consumer<PreferenceProvider>(builder: (context, preference, child) {
          return Container(
            color: changeBackgroundColor(context),
            child: Column(
              children: [
                Expanded(
                    child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(children: [
                      SizedBox(
                        height: 30,
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Text(
                                  "Diet",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ))),
                      ),
                      // DropdownContent(items: dietItems),
                      Divider(
                        thickness: 1,
                        color: tertiaryColor,
                      ),
                      ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: preference.diet.keys.map((String key) {
                          return CheckboxListTile(
                            title: Text(key),
                            value: preference.diet[key],
                            onChanged: (bool? value) {},
                            activeColor: primaryColor,
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 30,
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Text(
                                  "Intolerance",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ))),
                      ),
                      Divider(
                        thickness: 1,
                        color: tertiaryColor,
                      ),
                      // DropdownContent(items: intoleranceItems),
                      ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: preference.intolerance.keys.map((String key) {
                          return CheckboxListTile(
                            title: Text(key),
                            value: preference.intolerance[key],
                            onChanged: (bool? value) {},
                            activeColor: primaryColor,
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 30,
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Text(
                                  "Meal Type",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ))),
                      ),
                      Divider(
                        thickness: 1,
                        color: tertiaryColor,
                      ),
                      // DropdownContent(items: mealTypeItems),
                      ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: preference.mealtype.keys.map((String key) {
                          return CheckboxListTile(
                            title: Text(key),
                            value: preference.mealtype[key],
                            onChanged: (bool? value) {},
                            activeColor: primaryColor,
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 30,
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Text(
                                  "Cuisine Type",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ))),
                      ),
                      Divider(
                        thickness: 1,
                        color: tertiaryColor,
                      ),
                      // DropdownContent(items: cuisineTypeItems),
                      ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: preference.cuisinetype.keys.map((String key) {
                          return CheckboxListTile(
                            title: Text(key),
                            value: preference.cuisinetype[key],
                            onChanged: (bool? value) {},
                            activeColor: primaryColor,
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ]),
                  ),
                )),
              ],
            ),
          );
        }),
        floatingActionButton: FloatingActionButton(
          backgroundColor: primaryColor,
          tooltip: lbl_Edit,
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => SetPreferences()));
          },
          child: Icon(
            Icons.edit,
            color: secondaryColor,
          ),
        ),
      ),
    );
  }
}
