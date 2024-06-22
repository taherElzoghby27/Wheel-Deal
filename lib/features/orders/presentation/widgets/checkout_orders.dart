import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/customButton.dart';
import 'package:flutter/material.dart';

class CheckOutOrders extends StatelessWidget {
  const CheckOutOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: AspectRatio(
        aspectRatio: AppConsts.aspectRatioButtonAuth,
        child: CustomButton(
          text: StringsEn.checkOut,
          onTap: () {},
          styleText: AppConsts.style16White,
        ),
      ),
    );
  }
}
