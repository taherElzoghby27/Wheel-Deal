import 'package:carousel_slider/carousel_options.dart';
import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';

carouselOption(
  double height, {
  required dynamic Function(int v, CarouselPageChangedReason c)? onPageChanged,
}) {
  return CarouselOptions(
    height: height,
    viewportFraction: .9,
    initialPage: 0,
    autoPlay: false,
    autoPlayAnimationDuration: const Duration(milliseconds: 800),
    autoPlayCurve: Curves.fastOutSlowIn,
    enlargeCenterPage: true,
    enlargeFactor: 1,
    onPageChanged: onPageChanged,
    scrollDirection: Axis.horizontal,
  );
}
