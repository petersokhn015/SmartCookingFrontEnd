import 'package:app/Utils/AppColors.dart';
import 'package:app/Utils/Strings.dart';
import 'package:app/Widgets/ApplicationBar.dart';
import 'package:flutter/material.dart';

class myPreferences extends StatefulWidget {
  const myPreferences({ Key? key }) : super(key: key);

  @override
  State<myPreferences> createState() => _myPreferencesState();
}

class _myPreferencesState extends State<myPreferences> {
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
              color: secondaryColor, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )),
        body: Text("Preferences"),
      ),
    );
  }
}
