import 'package:cars/core/networking/failure_message.dart';
import 'package:cars/core/helper/use_case.dart';
import 'package:cars/features/search/domain/entities/search_entity.dart';
import 'package:cars/features/search/domain/repos/search_repo.dart';
import 'package:dartz/dartz.dart';

class BodyTypeFilterUseCase
    extends BaseUseCase<List<SearchFilterEntity>, String> {
  final SearchRepo _searchRepo;

  BodyTypeFilterUseCase({
    required SearchRepo searchRepo,
  }) : _searchRepo = searchRepo;

  @override
  Future<Either<FailureServ, List<SearchFilterEntity>>> call(
    String parameter,
  ) async {
    return await _searchRepo.bodyTypeFilter(
      brand: parameter,
    );
  }
}
