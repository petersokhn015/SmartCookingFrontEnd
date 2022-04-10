import 'package:app/Screens/MyPreferences.dart';
import 'package:app/Utils/AppColors.dart';
import 'package:app/Utils/Strings.dart';
import 'package:app/Widgets/AccesButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                      height: 150,
                      width: 150,
                      child: Stack(
                          clipBehavior: Clip.none,
                          fit: StackFit.expand,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 18,
                              child: ClipOval(
                                child: Image.asset(
                                  appLogoNoText,
                                  fit: BoxFit.fitWidth,
                                  width: 150,
                                  height: 150,
                                ),
                              ),
                            ),
                            Positioned(
                              right: -10,
                              bottom: 0,
                              child: ButtonTheme(
                                minWidth: 46,
                                height: 46,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Icon(
                                    Icons.edit,
                                    color: secondaryColor,
                                    size: 20,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                    padding: EdgeInsets.only(),
                                  ),
                                ),
                              ),
                            )
                          ])),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Joteif",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Divider(
                    color: primaryColor,
                    thickness: 1.0,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  AccesButton(title: lbl_My_Account, icon: FeatherIcons.user, onPressed: (){

                  },),
                  SizedBox(
                    height: 10,
                  ),
                  AccesButton(
                      title: lbl_My_Preferences, icon: FeatherIcons.database, onPressed:  () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => myPreferences()));
                      },),
                  SizedBox(
                    height: 10,
                  ),
                  AccesButton(title: lbl_My_Favorites, icon: Icons.star, onPressed: () {

                  },),
                ],
              ),
                      ),
                    ),
            )),
      ),
    );
  }
}
