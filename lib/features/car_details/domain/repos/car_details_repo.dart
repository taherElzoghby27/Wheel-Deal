import 'package:cars/core/errors/failure_message.dart';
import 'package:cars/core/models/car_model.dart';
import 'package:dartz/dartz.dart';

abstract class CarDetailsRepo {
  //get info about car
  Future<Either<FailureServ, CarModel>> getDetailsCar({required int carId});
}
