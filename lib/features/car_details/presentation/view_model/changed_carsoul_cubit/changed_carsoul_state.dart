part of 'changed_carsoul_cubit.dart';

@immutable
abstract class ChangedCarsoulState {}

class ChangedCarsoulInitial extends ChangedCarsoulState {}

class ChangedCrslState extends ChangedCarsoulState {
  final int index;

  ChangedCrslState({required this.index});
}
