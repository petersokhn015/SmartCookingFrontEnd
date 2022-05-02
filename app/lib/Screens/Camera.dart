import 'dart:io';
import 'package:app/Screens/Browse.dart';
import 'package:app/Screens/SetPreferences.dart';
import 'package:app/Services/CameraService.dart';
import 'package:app/Services/RecipeService.dart';
import 'package:app/Utils/AppColors.dart';
import 'package:app/Utils/Strings.dart';
import 'package:app/Widgets/Button.dart';
import 'package:app/Widgets/InputField.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  File? selectedImage;
  CameraService _cameraService = CameraService();
  TextEditingController inputController = TextEditingController();
  List<String> ingredients = [];

  Future getImage() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.camera);
    File? image = await File(file!.path);
    setState(() {
      selectedImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Scaffold(
              body: SingleChildScrollView(
                  child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.25,
                        child: selectedImage != null
                            ? Image.file(selectedImage!)
                            : Center(
                                child: Text(
                                  lbl_Please_Get_the_Image,
                                ),
                              ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: primaryColor)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ButtonPrimary(
                        text: "Get Ingredients",
                        onClicked: () async {
                          var labels = await _cameraService.submitSubscription(
                              selectedImage!, basename(selectedImage!.path));
                          setState(() {
                            ingredients = labels;
                          });

                          String input = "";
                          for (var e in ingredients) {
                            input += e + ",";
                          }
                          inputController.text = input;
                        }),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Or",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: InputField(
                        label: lbl_Input_Recipe,
                        obscureText: false,
                        controllerText: inputController,
                      )),
                ],
              )),
              floatingActionButton:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                        backgroundColor: primaryColor,
                        heroTag: lbl_Pick_Image,
                        onPressed: getImage,
                        tooltip: lbl_Pick_Image,
                        child: Icon(
                          Icons.add_a_photo,
                          color: secondaryColor,
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    FloatingActionButton(
                        backgroundColor: primaryColor,
                        heroTag: lbl_Get_Recipe,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Browse(
                                    ingredientList: ["banana", "apple"],
                                  )));
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => SetPreferences()));
                        },
                        tooltip: lbl_Get_Recipe,
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: secondaryColor,
                        )),
                  ],
                )
              ]),
            )));
  }
}
