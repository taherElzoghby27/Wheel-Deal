import 'package:cars/core/consts/style.dart';
import 'package:flutter/cupertino.dart';

import 'brands_detail.dart';

class FavouritesBody extends StatelessWidget {
  const FavouritesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: const [
          AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),
          //favourites car

          BrandsDetails(),
        ],
      ),
    );
  }
}
