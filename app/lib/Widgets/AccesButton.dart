import 'package:app/Utils/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class AccesButton extends StatelessWidget {
  String title;
  IconData icon;
  Function()? onPressed;
  AccesButton({Key? key, required this.title, required this.icon, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
          onPressed: onPressed,
          child: Row(
            children: [
              Icon(
                icon,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Icon(Icons.arrow_forward_ios)
            ],
          )),
    );
  }
}
