part of 'filter_cubit.dart';

@immutable
abstract class FilterState {}

class ConditionInitial extends FilterState {}

class ValueChanged extends FilterState {}

class PriceRangeChanged extends FilterState {}
