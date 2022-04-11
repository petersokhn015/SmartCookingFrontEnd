import 'package:app/Utils/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: secondaryColor,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 250,
                width: 250,
                child: LoadingIndicator(
                  indicatorType: Indicator.pacman,
                  colors: [primaryColor, tertiaryColor, tertiaryColor],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
