import 'package:cars/core/theming/style.dart';
import 'package:flutter/material.dart';

class LoadWidget extends StatelessWidget {
  const LoadWidget({super.key, this.width});

  final double? width;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: AppConsts.padding4,
      child: Container(
        width: width ?? size.width * .35,
        decoration: BoxDecoration(
          color: AppConsts.neutral400,
          borderRadius: AppConsts.mainRadius,
        ),
      ),
    );
  }
}
