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
  List<Widget> widgets = [];

  @override
  Widget build(BuildContext context) {
    if (widgets.isEmpty)
      widget.tags
          .map((value) => {
                widgets.add(
                  ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 50),
                    child: CheckboxListTile(
                      title: Text(
                        value,
                        style: TextStyle(color: changeTextColor(context)),
                      ),
                      value: false,
                      onChanged: (newValue) {},
                      activeColor: primaryColor,
                      controlAffinity: ListTileControlAffinity.trailing,
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
