part of 'car_details_bloc.dart';

@immutable
sealed class CarDetailsState {}

final class CarDetailsInitial extends CarDetailsState {}

class CarDetailsLoading extends CarDetailsState {}

class CarDetailsLoaded extends CarDetailsState {
  final CarModel carModel;

  CarDetailsLoaded({required this.carModel});
}

class CarDetailsFailure extends CarDetailsState {
  final String message;

  CarDetailsFailure({required this.message});
}
