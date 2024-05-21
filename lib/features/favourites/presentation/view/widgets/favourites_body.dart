import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';

import '../../../../home/presentation/view/widgets/best_offers_bloc_consumer_grid_view.dart';

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
          //best offers

          BestOffersBlocConsumer(),
        ],
      ),
    );
  }
}
