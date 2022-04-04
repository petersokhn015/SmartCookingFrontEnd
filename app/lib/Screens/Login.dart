import 'package:app/Screens/SignUp.dart';
import 'package:app/Utils/AppColors.dart';
import 'package:app/Utils/Strings.dart';
import 'package:app/Widgets/Button.dart';
import 'package:app/Widgets/InputField.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sideColorTheme,
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
                      color: Colors.white),
                ),
              ),
              width: getBiglDiameter(context),
              height: getBiglDiameter(context),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [mainColorTheme, mainColorTheme],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ListView(
              children: [
                Container(
                  height: 140,
                  width: 530,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white),
                  margin: const EdgeInsets.fromLTRB(20, 300, 20, 10),
                  child: Column(
                    children: [
                      TextFormField(
                        onTap: () {
                          setState(() {
                            _isVisible = false;
                          });
                        },
                        controller:
                            usernameController, // Controller for Username
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Username",
                            contentPadding: EdgeInsets.all(20)),
                        onEditingComplete: () =>
                            FocusScope.of(context).nextFocus(),
                      ),
                      Divider(
                        thickness: 3,
                      ),
                      TextFormField(
                        onTap: () {
                          setState(() {
                            _isVisible = false;
                          });
                        },

                        controller:
                            passwordController, // Controller for Password
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",
                            contentPadding: EdgeInsets.all(20),
                            // Adding the visibility icon to toggle visibility of the password field
                            suffixIcon: IconButton(
                              color: mainColorTheme,
                              icon: Icon(_isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility),
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
                              splashColor: Colors.amber,
                              onTap: () {},
                              child: const Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: mainColorTheme),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "DON'T HAVE AN ACCOUNT ? ",
                      style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: Text(
                        " SIGN UP",
                        style: TextStyle(
                            fontSize: 11,
                            color: mainColorTheme,
                            fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
