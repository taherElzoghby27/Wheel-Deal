import 'package:cars/core/consts/style.dart';
import 'package:cars/core/helper/handle_image.dart';
import 'package:flutter/material.dart';

class BrandItem extends StatelessWidget {
  const BrandItem({super.key, required this.brand});

  final Map<String, dynamic> brand;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: AppConsts.padding8h,
      child: Container(
        decoration: AppConsts.mainDecoration,
        child: Padding(
          padding: AppConsts.mainPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: size.width * .15,
                child: HandleImageWidget(image: brand['Logo']),
              ),
              Text(
                brand['brandName'],
                style: AppConsts.style16White.copyWith(
                  color: Theme.of(context).canvasColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
