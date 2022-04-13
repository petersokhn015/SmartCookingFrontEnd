import 'package:flutter/material.dart';

import 'package:app/Utils/AppColors.dart';

class Tag extends StatefulWidget {
  final String text;
  late bool isActive;
  final bool isPressable;
  final VoidCallback? voidCallback;

  Tag({
    Key? key,
    required this.text,
    required this.isActive,
    required this.isPressable,
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
      constraints: BoxConstraints(maxHeight: 35, maxWidth: 100),
      child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: mainColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              side: BorderSide(color: primaryColor)),
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(fontSize: 14, color: textColor),
            ),
          ),
          onPressed: widget.voidCallback),
    );
  }
}
