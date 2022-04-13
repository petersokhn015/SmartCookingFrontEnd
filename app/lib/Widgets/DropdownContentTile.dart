import 'package:app/Utils/AppColors.dart';
import 'package:flutter/material.dart';

class DropdownContentTile extends StatefulWidget {
  final List<String> tags;
  const DropdownContentTile({
    Key? key,
    required this.tags,
  }) : super(key: key);

  @override
  State<DropdownContentTile> createState() => _DropdownContentTileState();
}

class _DropdownContentTileState extends State<DropdownContentTile> {
  List<bool> isChecked = [];
  List<Widget> widgets = [];

  @override
  Widget build(BuildContext context) {
    if (widgets.isEmpty)
      widget.tags
          .map((value) => {
                widgets.add(
                  ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 40),
                    child: CheckboxListTile(
                      title: Text(
                        value,
                        style: TextStyle(color: primaryColor),
                      ),
                      value: false,
                      onChanged: (newValue) {
                        setState(() {});
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                )
              })
          .toList();
    return Column(
      children: widgets,
    );
  }
}
