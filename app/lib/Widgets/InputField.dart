import 'package:app/Utils/AppColors.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final TextEditingController controllerText;

  const InputField({Key? key, required this.label, required this.obscureText, required this.controllerText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllerText,
        decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primaryColor),
        borderRadius: BorderRadius.circular(10.0),
      ),
      hintText: label,
    ),
    obscureText: obscureText,);
  }
}
