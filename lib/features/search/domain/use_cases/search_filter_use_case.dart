import 'package:cars/core/errors/failure_message.dart';
import 'package:cars/core/usecases/use_case.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';
import 'package:cars/features/search/domain/entities/search_entity.dart';
import 'package:cars/features/search/domain/repos/search_repo.dart';
import 'package:dartz/dartz.dart';

class SearchFilterUseCase extends BaseUseCase<List<CarEntity>, SearchFilterEntity> {
  final SearchRepo _searchRepo;

  SearchFilterUseCase({
    required SearchRepo searchRepo,
  }) : _searchRepo = searchRepo;

  @override
  Future<Either<FailureServ, List<CarEntity>>> call(SearchFilterEntity parameter) async {
    return await _searchRepo.searchFilter(
      searchEntity: parameter,
    );
  }
}
