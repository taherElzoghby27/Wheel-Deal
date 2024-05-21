import 'package:cars/core/consts/style.dart';
import 'package:cars/features/home/presentation/view_model/home_bloc/home_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_consumer_recommended_for_you_grid_view.dart';

class RecommendedForYouBody extends StatefulWidget {
  const RecommendedForYouBody({super.key});

  @override
  State<RecommendedForYouBody> createState() => _RecommendedForYouBodyState();
}

class _RecommendedForYouBodyState extends State<RecommendedForYouBody> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(const AddRecommendedForYouEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: const Column(
        children: [
          AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),
          //recommended for you cars

          Expanded(
            child: BlocConsumerRecommendedForYouGridView(),
          ),
        ],
      ),
    );
  }
}
