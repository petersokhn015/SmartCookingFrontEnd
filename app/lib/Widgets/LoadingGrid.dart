import 'package:app/Widgets/LoadingCard.dart';
import 'package:flutter/material.dart';

class LoadingGrid extends StatelessWidget {
  const LoadingGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: 8,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 2.0, mainAxisSpacing: 2.0),
        itemBuilder: (BuildContext context, int index) {
          return LoadingCard();
        });
  }
}
