import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class CarouselWidget extends StatelessWidget {
  final List<String> items;

  const CarouselWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: items.length,
      options: CarouselOptions(
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 3,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(seconds: 2),
        viewportFraction: 0.8,
      ),
      itemBuilder: (context, index, realIndex) {
        return Container(
          height: 200,
          width: 300,
          margin: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                items[index],
              ),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.white,
                ],
              ),
            ),
            child: Column(
              children: [Text("Ozbekiston")],
            ),
          ),
        );
      },
    );
  }
}
