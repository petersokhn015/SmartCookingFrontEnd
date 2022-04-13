import 'package:app/Widgets/FilterOverlay.dart';
import 'package:flutter/material.dart';
import 'package:app/Utils/AppColors.dart';

class DropdownContent extends StatefulWidget {
  final List<DropDownItem> items;
  const DropdownContent({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  State<DropdownContent> createState() => _DropdownContentState();
}

class _DropdownContentState extends State<DropdownContent> {
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      elevation: 0,
      dividerColor: primaryColor,
      expansionCallback: (panelIndex, isExpanded) {
        setState(() {
          widget.items[panelIndex].isExpended =
              !widget.items[panelIndex].isExpended;
        });
      },
      children: widget.items.map((DropDownItem item) {
        return ExpansionPanel(
            backgroundColor: secondaryColor,
            headerBuilder: (context, isExpanded) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.header,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: primaryColor),
                  ),
                ],
              );
            },
            body: item.body,
            isExpanded: item.isExpended,
            canTapOnHeader: true);
      }).toList(),
    );
  }
}
