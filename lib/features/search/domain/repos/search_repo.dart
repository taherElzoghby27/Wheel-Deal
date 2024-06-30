import 'package:cars/core/networking/failure_message.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';
import 'package:cars/features/search/data/models/recent_search_model.dart';
import 'package:cars/features/search/domain/entities/search_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  //search
  Future<Either<FailureServ, List<CarEntity>>> search({
    required String searchWord,
  });

  //search filter
  Future<Either<FailureServ, List<CarEntity>>> searchFilter({
    required SearchFilterEntity searchEntity,
  });

  //fetch bodyType
  Future<Either<FailureServ, List<SearchFilterEntity>>> bodyTypeFilter({
    required String brand,
  });

//fetch recent search
  Future<Either<FailureServ, List<RecentSearchModel>>> recentSearch();

//delete recent search
  Future<Either<FailureServ, void>> deleteRecentSearch({
    required String searchQuery,
  });

  //get brands
  Future<Either<FailureServ, List<SearchFilterEntity>>> getBrands();
}
