part of 'filter_cubit.dart';

@immutable
abstract class FilterState {}

class ConditionInitial extends FilterState {}

class ValueChange extends FilterState {}

class PriceRangeChanged extends FilterState {}

class ValueFacilityChange extends FilterState {}

class SearchFilterLoading extends FilterState {}

class SearchFilterLoaded extends FilterState {
  final List<CarEntity> cars;

  SearchFilterLoaded({required this.cars});
}

class SearchFilterFailure extends FilterState {
  final String message;

  SearchFilterFailure({required this.message});
}
