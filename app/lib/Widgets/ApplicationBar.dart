import 'package:app/Utils/AppColors.dart';
import 'package:flutter/material.dart';

class ApplicationBar extends StatelessWidget {
  String title;
  ApplicationBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      title: Text(
        title,
        style: TextStyle(
            color: secondaryColor, fontWeight: FontWeight.bold, fontSize: 25),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
