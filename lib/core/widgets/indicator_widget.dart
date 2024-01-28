import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/indicator.dart';
import 'package:flutter/material.dart';

class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget({
    super.key,
    required this.currentPage,
  });

  final int currentPage;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        indicator(
          height: currentPage == 0 ? size.height * .012 : size.height * .01,
          color: currentPage == 0 ? AppConsts.primary500 : AppConsts.primary200,
          width: currentPage == 0 ? size.width * .023 : size.width * .02,
        ),
        indicator(
          height: currentPage == 1 ? size.height * .012 : size.height * .01,
          color: currentPage == 1 ? AppConsts.primary500 : AppConsts.primary200,
          width: currentPage == 1 ? size.width * .023 : size.width * .02,
        ),
        indicator(
          height: currentPage == 2 ? size.height * .012 : size.height * .01,
          color: currentPage == 2 ? AppConsts.primary500 : AppConsts.primary200,
          width: currentPage == 2 ? size.width * .023 : size.width * .02,
        ),
      ],
    );
  }
}
