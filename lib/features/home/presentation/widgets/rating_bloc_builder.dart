import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/recommendation_feature_cubit/recommendation_feature_cubit.dart';
import 'star_rating_widget.dart';

class RatingBlocBuilder extends StatelessWidget {
  const RatingBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendationFeatureCubit, RecommendationFeatureState>(
      builder: (context, state) {
        RecommendationFeatureCubit cubit =
            context.read<RecommendationFeatureCubit>();
        return StarRating(
          initialRating: cubit.rating,
          onRatingUpdate: (double value) => cubit.changeValueRating(
            value,
          ),
        );
      },
    );
  }
}
