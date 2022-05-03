import 'package:app/Providers/UserProvider.dart';
import 'package:app/Screens/MainPage.dart';
import 'package:app/Screens/SignUp.dart';
import 'package:app/Services/LoginService.dart';
import 'package:app/Utils/AppColors.dart';
import 'package:app/Utils/Strings.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  double getBiglDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 11 / 8;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;
  bool _isVisible = false;
  LoginService _loginService = LoginService();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Stack(
        children: [
          Positioned(
            left: -getBiglDiameter(context) / 8,
            top: -getBiglDiameter(context) / 8,
            child: Container(
              child: const Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontFamily: "Pacifico",
                      fontSize: 40,
                      color: secondaryColor),
                ),
              ),
              width: getBiglDiameter(context),
              height: getBiglDiameter(context),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [primaryColor, primaryColor],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: ListView(
                children: [
                  Container(
                    width: 530,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: primaryColor, style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: secondaryColor),
                    margin: const EdgeInsets.fromLTRB(20, 300, 20, 10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          onTap: () {
                            setState(() {
                              _isVisible = false;
                            });
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required";
                            } else {
                              return null;
                            }
                          },
                          controller:
                              usernameController, // Controller for Username
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: lbl_Username,
                              contentPadding: EdgeInsets.all(15)),
                          onEditingComplete: () =>
                              FocusScope.of(context).nextFocus(),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Divider(
                          color: primaryColor,
                          thickness: 1,
                        ),
                        TextFormField(
                          onTap: () {
                            setState(() {
                              _isVisible = false;
                            });
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required";
                            } else {
                              return null;
                            }
                          },
                          controller:
                              passwordController, // Controller for Password
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              contentPadding: EdgeInsets.all(15),
                              // Adding the visibility icon to toggle visibility of the password field
                              suffixIcon: IconButton(
                                color: primaryColor,
                                icon: Icon(_isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                iconSize: 20,
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                },
                              )),
                          obscureText: _isObscure,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 40,
                          child: Container(
                            child: Material(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(20),
                                onTap: () async {
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  if (formKey.currentState!.validate()) {
                                    var isUserFound =
                                        await _loginService.isUserExist(
                                            usernameController.text,
                                            passwordController.text);

                                    if (isUserFound == true) {
                                      prefs.setString(prefs_Username,
                                          usernameController.text);

                                      Fluttertoast.showToast(
                                          msg: "Logged in Successfully",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: tertiaryColor,
                                          textColor: secondaryColor,
                                          fontSize: 16.0);

                                      if (prefs.getBool(prefs_DarkMode) ==
                                          null) {
                                        prefs.setBool(prefs_DarkMode, false);
                                      }

                                      await prefs.setBool(
                                          prefs_isLoggedIn, true);

                                      Provider.of<UserProvider>(context,
                                              listen: false)
                                          .saveUser(usernameController.text,
                                              passwordController.text);

                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MainPage()));
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: "Login Failed",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: tertiaryColor,
                                          textColor: secondaryColor,
                                          fontSize: 16.0);
                                    }
                                  }
                                },
                                child: const Center(
                                  child: Text(
                                    lbl_Login,
                                    style: TextStyle(
                                        color: secondaryColor,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        txt_Login,
                        style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignUp()));
                        },
                        child: Text(
                          " " + lbl_SignUp,
                          style: TextStyle(
                              fontSize: 11,
                              color: primaryColor,
                              fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
