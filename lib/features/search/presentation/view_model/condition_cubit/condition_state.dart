part of 'condition_cubit.dart';

@immutable
abstract class ConditionState {}

class ConditionInitial extends ConditionState {}

class ConditionChanged extends ConditionState {}
