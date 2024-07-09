import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSliderWidget extends StatelessWidget {
  const ImageSliderWidget({super.key, required this.bannerUrlItems,});
  final List<String> bannerUrlItems;

  @override
  Widget build(BuildContext context) {
    Size appSize = MediaQuery.of(context).size;

    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 360,
        autoPlay: true,
        viewportFraction: 1,
      ),
      itemCount: bannerUrlItems.length,
      itemBuilder: (context, itemIndex, realIndex){
        return Stack(
          children: [
            Image.asset(
              bannerUrlItems[itemIndex],
              fit: BoxFit.cover,
              width: appSize.width,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                color: Colors.black38,
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  (itemIndex + 1).toString() + " / " + bannerUrlItems.length.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
