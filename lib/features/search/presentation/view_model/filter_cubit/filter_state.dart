part of 'filter_cubit.dart';

@immutable
abstract class FilterState {}

class ConditionInitial extends FilterState {}

class ConditionChanged extends FilterState {}
