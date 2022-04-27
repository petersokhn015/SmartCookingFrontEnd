import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IngredientCard extends StatelessWidget {
  final String imageUrl, name, unit;
  final double amount;
  const IngredientCard({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.amount,
    required this.unit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.contain,
                ),
              )),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text(
                amount.toString() + " " + unit,
                style: TextStyle(fontSize: 14),
              ))
        ],
      ),
    );
  }
}
