import 'package:app/Screens/Login.dart';
import 'package:app/Screens/MainPage.dart';
import 'package:app/Screens/SignUp.dart';
import 'package:app/Utils/AppColors.dart';
import 'package:app/Utils/Strings.dart';
import 'package:app/Widgets/Button.dart';
import 'package:flutter/material.dart';

class Choices extends StatefulWidget {
  const Choices({Key? key}) : super(key: key);

  @override
  State<Choices> createState() => _ChoicesState();
}

class _ChoicesState extends State<Choices> {
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
                onClicked: () {
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
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MainPage()));
                })
          ]),
        ),
      ),
    );
  }
}
