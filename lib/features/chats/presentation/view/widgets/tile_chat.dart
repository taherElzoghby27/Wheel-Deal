import 'package:cars/core/consts/style.dart';
import 'package:cars/core/helper/handle_image.dart';
import 'package:flutter/material.dart';

class TileChat extends StatelessWidget {
  const TileChat({
    super.key,
    required this.image,
    required this.label,
    this.onTap,
  });

  final String image;
  final String label;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppConsts.mainRadius,
      child: AspectRatio(
        aspectRatio: AppConsts.aspectRatio16on2,
        child: Container(
          decoration: AppConsts.mainDecoration,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: AppConsts.padding4,
                  child: HandleImageWidget(image: image),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  label,
                  style: AppConsts.style14.copyWith(
                    color: Theme.of(context).canvasColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const Expanded(
                child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppConsts.mainColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
