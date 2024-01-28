import 'package:cars/core/consts/assets.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///custom appBar
        CustomAppBar(
          image: Assets.imagesLogo,
          title: StringsEn.logo,
          trailingOnTap: () {},
          trailingWidget: const Icon(
            Icons.favorite_outline,
            color: AppConsts.primary300,
          ),
        ),
      ],
    );
  }
}
