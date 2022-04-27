import 'package:app/Utils/AppColors.dart';
import 'package:flutter/material.dart';

class InstructionsList extends StatelessWidget {
  final List<String> steps;
  const InstructionsList({
    Key? key,
    required this.steps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 600),
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        itemCount: steps.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              "Step: " + index.toString(),
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: secondaryColor,
                fontSize: 20,
              ),
            ),
            subtitle: Text(
              "  " + steps[index],
              style: TextStyle(fontSize: 18, color: secondaryColor),
            ),
          );
        },
      ),
    );
  }
}
