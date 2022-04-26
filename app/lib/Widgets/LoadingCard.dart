import 'package:app/Utils/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingCard extends StatelessWidget {
  final double? width;
  final double? height;
  const LoadingCard({Key? key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 11, vertical: 10),
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey,
          ),
        ),
        baseColor: secondaryColor,
        highlightColor: Colors.grey);
  }
}
