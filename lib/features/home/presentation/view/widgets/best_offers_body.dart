import 'package:flutter/cupertino.dart';

import '../../../../../core/consts/style.dart';
import '../../../../favourites/presentation/view/widgets/brands_detail.dart';

class BestOffersBody extends StatelessWidget {
  const BestOffersBody({super.key});

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
