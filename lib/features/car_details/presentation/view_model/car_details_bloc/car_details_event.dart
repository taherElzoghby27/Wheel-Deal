part of 'car_details_bloc.dart';

@immutable
sealed class CarDetailsEvent {}

class CrDetailsEvent extends CarDetailsEvent {
  final int carId;

  CrDetailsEvent({required this.carId});
}
