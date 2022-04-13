import 'package:app/Utils/AppColors.dart';
import 'package:flutter/material.dart';

class FilterDivider extends StatelessWidget {
  const FilterDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: MediaQuery.of(context).size.width - 50,
          color: primaryColor,
          height: 2,
        ),
      ],
    );
  }
}
