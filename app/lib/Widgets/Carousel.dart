import 'package:app/Services/Service.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CarouselSlider(
            items: FutureBuilder<List<Widget>>(future: getRecommendations(), builder: ,),
            options: options)
      ],
    );
  }
}
