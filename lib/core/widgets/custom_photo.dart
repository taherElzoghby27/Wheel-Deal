import 'package:cached_network_image/cached_network_image.dart';
import 'package:cars/core/widgets/small_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPhoto extends StatelessWidget {
  const CustomPhoto({
    super.key,
    required this.height,
    required this.image,
  });

  final double height;
  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.sp),
      child: CachedNetworkImage(
        height: height,
        imageUrl: image,
        placeholder: (context, url) => const LoadingWidget(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
