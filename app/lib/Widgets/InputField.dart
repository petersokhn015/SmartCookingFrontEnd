import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final bool obscureText;

  const InputField({Key? key, required this.label, required this.obscureText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
                      decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: "Enabled decoration text ...",
                  ));
  }
}
