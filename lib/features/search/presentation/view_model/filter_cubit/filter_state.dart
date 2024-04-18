part of 'filter_cubit.dart';

@immutable
abstract class FilterState {}

class ConditionInitial extends FilterState {}

class ValueChange extends FilterState {}

class PriceRangeChanged extends FilterState {}

class ValueFacilityChange extends FilterState {}
