import 'package:cars/core/errors/failure_message.dart';
import 'package:cars/features/home/domain/entities/brand_entity.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<FailureServ, List<BrandEntity>>> getTopBrands({
    required int page,
  });

  Future<Either<FailureServ, List<CarEntity>>> getRecommendedForYou({
    required int page,
  });

  Future<Either<FailureServ, List<CarEntity>>> getBestOffers({
    required int page,
  });

  Future<Either<FailureServ, List<CarEntity>>> getFavourites({
    required int page,
  });
}
