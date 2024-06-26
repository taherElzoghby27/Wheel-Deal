part of 'recommendation_feature_cubit.dart';

@immutable
class RecommendationFeatureState {
  final RequestState valueChanged;
  final String valueCh;
  final RequestState getModelsTypesState;
  final String failureGetModelsTypes;
  final List<PreviousCarEntity> carNames;

  const RecommendationFeatureState({
    this.valueChanged = RequestState.initial,
    this.valueCh = '',
    this.getModelsTypesState = RequestState.initial,
    this.failureGetModelsTypes = 'No Data',
    this.carNames = const [],
  });

  RecommendationFeatureState copyWith({
    RequestState? valueChanged,
    String? valueCh,
    RequestState? getModelsTypesState,
    String? failureGetModelsTypes,
    List<PreviousCarEntity>? carNames,
  }) {
    return RecommendationFeatureState(
      valueChanged: valueChanged ?? this.valueChanged,
      valueCh: valueCh ?? this.valueCh,
      getModelsTypesState: getModelsTypesState ?? this.getModelsTypesState,
      failureGetModelsTypes:
          failureGetModelsTypes ?? this.failureGetModelsTypes,
      carNames: carNames ?? this.carNames,
    );
  }
}

final class RecommendationFeatureInitial extends RecommendationFeatureState {}

class UserInfoLoading extends RecommendationFeatureState {}

class UserInfoLoaded extends RecommendationFeatureState {}

class UserInfoFailure extends RecommendationFeatureState {
  final String message;

  const UserInfoFailure({required this.message});
}

class PreviousCarLoading extends RecommendationFeatureState {}

class PreviousCarLoaded extends RecommendationFeatureState {}

class PreviousCarFailure extends RecommendationFeatureState {
  final String message;

  const PreviousCarFailure({required this.message});
}

class ChangedValueRating extends RecommendationFeatureState {
  final double value;

  const ChangedValueRating({required this.value});
}
