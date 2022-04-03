import 'package:app/Screens/Choices.dart';
import 'package:app/Utils/AppColors.dart';
import 'package:app/Utils/Strings.dart';
import 'package:app/Widgets/Button.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  void choicesPage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Choices()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: mainColorTheme,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(chefPandaLogo), fit: BoxFit.cover)),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Button(text: "Get Started", onClicked: choicesPage)
          ]),
        ),
      ),
    );
  }
}
