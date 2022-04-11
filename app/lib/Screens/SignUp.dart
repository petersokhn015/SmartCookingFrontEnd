import 'package:app/Screens/Login.dart';
import 'package:app/Utils/AppColors.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  double getBiglDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 11 / 8;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool _isObscurePassword = true;
  bool _isObscureCPassword = true;
  bool _isVisible = false;

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
                  "Sign Up",
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
            child: ListView(
              children: [
                Container(
                  width: 530,
                  decoration: BoxDecoration(
                    border: Border.all(color: primaryColor),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: secondaryColor),
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
                        thickness: 1,
                        color: primaryColor,
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
                              color: primaryColor,
                              icon: Icon(_isObscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _isObscurePassword = !_isObscurePassword;
                                });
                              },
                            )),
                        obscureText: _isObscurePassword,
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

                        controller:
                            confirmPasswordController, // Controller for Password
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Confirm Password",
                            contentPadding: EdgeInsets.all(20),
                            // Adding the visibility icon to toggle visibility of the password field
                            suffixIcon: IconButton(
                              color: primaryColor,
                              icon: Icon(_isObscureCPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _isObscureCPassword = !_isObscureCPassword;
                                });
                              },
                            )),
                        obscureText: _isObscureCPassword,
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
                              onTap: () {},
                              child: const Center(
                                child: Text(
                                  "Next",
                                  style: TextStyle(
                                      color: secondaryColor,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: primaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "ALREADY HAVE AN ACCOUNT ? ",
                      style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Text(
                        " LOGIN",
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
          )
        ],
      ),
    );
  }
}
