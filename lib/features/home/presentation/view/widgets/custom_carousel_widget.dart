import 'package:carousel_slider/carousel_slider.dart';
import 'package:cars/core/consts/data.dart';
import 'package:cars/features/home/presentation/view/widgets/custom_image_carousel.dart';
import 'package:flutter/material.dart';

class CustomCarousel extends StatelessWidget {
  const CustomCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AspectRatio(
      aspectRatio: 4 / 2.25,
      child: CarouselSlider(
        items: cars
            .map(
              (image) => CustomImageCarousel(image: image),
            )
            .toList(),
        options: CarouselOptions(
          height: size.height,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 1,
          onPageChanged: (int index, CarouselPageChangedReason c) {},
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
