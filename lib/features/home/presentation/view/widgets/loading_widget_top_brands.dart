import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';

class LoadingWidgetTopBrand extends StatelessWidget {
  const LoadingWidgetTopBrand({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: AppConsts.padding4,
      child: Container(
        width: size.width * .3,
        decoration: BoxDecoration(
          color: AppConsts.neutral400,
          borderRadius: AppConsts.mainRadius,
        ),
      ),
    );
  }
}
