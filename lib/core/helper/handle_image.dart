import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../consts/strings.dart';
import '../widgets/small_loading_widget.dart';

//check photo type
String checkPhotoType(String image) =>
    image.endsWith(StringsEn.jpg) && !image.startsWith(StringsEn.https)
        ? StringsEn.jpg
        : image.endsWith(StringsEn.png) && !image.startsWith(StringsEn.https)
            ? StringsEn.png
            : image.endsWith(StringsEn.svg)
                ? StringsEn.svg
                : StringsEn.network;
//handle image
Widget handleImage({required String image, double? height, double? width}) {
  String type = checkPhotoType(image);
  switch (type) {
    case 'jpg' || 'png':
      return Image.asset(
        image,
        height: height,
        width: width,
        fit: BoxFit.fill,
      );
    case 'svg':
      return SvgPicture.asset(
        image,
        height: height,
        width: width,
        fit: BoxFit.fill,
      );
    case 'network':
      return CachedNetworkImage(
        height: height,
        width: width,
        fit: BoxFit.fill,
        imageUrl: image,
        placeholder: (context, url) => const LoadingWidget(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      );
    default:
      return const Icon(Icons.error);
  }
}
