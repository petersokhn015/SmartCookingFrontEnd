import 'package:app/Utils/AppColors.dart';
import 'package:flutter/material.dart';

class Tag extends StatefulWidget {
  final String text;
  final bool isActive;
  final VoidCallback? voidCallback;

  const Tag({
    Key? key,
    required this.text,
    required this.isActive,
    this.voidCallback,
  }) : super(key: key);

  @override
  State<Tag> createState() => _TagState();
}

class _TagState extends State<Tag> {
  late Color mainColor, textColor;

  @override
  Widget build(BuildContext context) {
    if (widget.isActive) {
      mainColor = primaryColor;
      textColor = secondaryColor;
    } else {
      textColor = primaryColor;
      mainColor = secondaryColor;
    }

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 100, maxHeight: 35),
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: mainColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            side: BorderSide(color: primaryColor)),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(fontSize: 10, color: textColor),
          ),
        ),
        onPressed: widget.voidCallback,
      ),
    );
  }
}
