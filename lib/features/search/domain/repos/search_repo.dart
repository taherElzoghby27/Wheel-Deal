import 'package:cars/core/errors/failure_message.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';
import 'package:cars/features/search/data/models/recent_search_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  //search
  Future<Either<FailureServ, List<CarEntity>>> search({
    required String searchWord,
  });

//fetch recent search
  Future<Either<FailureServ, List<RecentSearchModel>>> recentSearch();

//delete recent search
  Future<Either<FailureServ, void>> deleteRecentSearch({
    required String searchQuery,
  });
}
