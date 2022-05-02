import 'package:app/Screens/Camera.dart';
import 'package:app/Screens/Home.dart';
import 'package:app/Screens/Login.dart';
import 'package:app/Screens/MainPage.dart';
import 'package:app/Screens/SignUp.dart';
import 'package:app/Services/LoginService.dart';
import 'package:app/Utils/AppColors.dart';
import 'package:app/Utils/Strings.dart';
import 'package:app/Widgets/Button.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Choices extends StatefulWidget {
  const Choices({Key? key}) : super(key: key);

  @override
  State<Choices> createState() => _ChoicesState();
}

class _ChoicesState extends State<Choices> {
  SharedPreferences? prefs;
  bool isLoggedIn = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializePreference().whenComplete(() {
      setState(() {});
    });
  }

  Future<void> initializePreference() async {
    prefs = await SharedPreferences.getInstance();
    isLoggedIn = await prefs!.setBool(prefs_isLoggedIn, false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(appLogo), fit: BoxFit.cover)),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Button(
                text: lbl_Login,
                onClicked: () async {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Login()));
                }),
            SizedBox(
              height: 30,
            ),
            Button(
                text: lbl_SignUp,
                onClicked: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => SignUp()));
                }),
            SizedBox(
              height: 30,
            ),
            Button(
                text: lbl_Skip,
                onClicked: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => MainPage()));
                })
          ]),
        ),
      ),
    );
  }
}
