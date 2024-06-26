import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/consts/style.dart';
import '../view_model/home_bloc/home_bloc.dart';
import 'best_offers_bloc_consumer.dart';

class BestOffersBody extends StatefulWidget {
  const BestOffersBody({super.key});

  @override
  State<BestOffersBody> createState() => _BestOffersBodyState();
}

class _BestOffersBodyState extends State<BestOffersBody> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(const AddBestOfferEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: const Column(
        children: [
          AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),
          Expanded(
            child: BestOffersBlocConsumer(),
          ),
        ],
      ),
    );
  }
}
