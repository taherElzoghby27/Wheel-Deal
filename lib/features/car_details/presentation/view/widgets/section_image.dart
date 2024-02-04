import 'package:cars/core/consts/assets.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/helper/handle_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/custom_app_bar.dart';

class SectionImage extends StatelessWidget {
  const SectionImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 16 / 11,
          child: handleImage(image: Assets.car1),
        ),
        CustomAppBar(
          leadingOnTap: () => GoRouter.of(context).pop(),
          title: '',
          trailingWidget: Container(),
          color: AppConsts.neutral100,
        ),
      ],
    );
  }
}
