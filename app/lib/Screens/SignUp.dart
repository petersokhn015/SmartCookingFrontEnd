import 'package:app/Screens/Login.dart';
import 'package:app/Screens/SetPreferences.dart';
import 'package:app/Services/SignUpService.dart';
import 'package:app/Utils/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:show_more_text_popup/show_more_text_popup.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  SignUpService _signUpService = SignUpService();
  final formKey = GlobalKey<FormState>();
  final helpKey = GlobalKey();

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
          Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Required";
                          } else if (!RegExp(
                                  r'^[a-zA-Z0-9]([._-](?![._-])|[a-zA-Z0-9]){3,18}[a-zA-Z0-9]$')
                              .hasMatch(value)) {
                            return "Invalid username";
                          } else {
                            return null;
                          }
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Required";
                          } else if (!RegExp(
                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                              .hasMatch(value)) {
                            return "Invalid password";
                          } else {
                            return null;
                          }
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Required";
                          } else if (passwordController.text !=
                              confirmPasswordController.text) {
                            return "Must be same as password";
                          } else {
                            return null;
                          }
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
                  height: 5,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                      padding: EdgeInsets.only(right: 20),
                      key: helpKey,
                      onPressed: () {
                        showMoreText();
                      },
                      icon: Icon(
                        Icons.help,
                        color: primaryColor,
                      )),
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
                                if (formKey.currentState!.validate()) {
                                  var isSignedUp = await _signUpService.SignUp(
                                      usernameController.text,
                                      passwordController.text);

                                  if (isSignedUp == true) {
                                    Fluttertoast.showToast(
                                        msg: "Signed Up Successfully",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: tertiaryColor,
                                        textColor: secondaryColor,
                                        fontSize: 16.0);

                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SetPreferences()));
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: "SignUp Failed",
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
                        Navigator.of(context).push(
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

  void showMoreText() {
    ShowMoreTextPopup popup = ShowMoreTextPopup(context,
        text:
            "Required: \n1 upper-case, \n1 lower-case, \n1 symbol & 1 number, \nwith at least 8 digits",
        textStyle: TextStyle(color: tertiaryColor),
        height: 100,
        width: 150,
        backgroundColor: secondaryColor,
        padding: EdgeInsets.all(8.0),
        borderRadius: BorderRadius.circular(10.0),
        onDismiss: () {});

    /// show the popup for specific widget
    popup.show(
      widgetKey: helpKey,
    );
  }
}
