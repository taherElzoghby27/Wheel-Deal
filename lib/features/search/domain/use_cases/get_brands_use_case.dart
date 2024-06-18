import 'package:cars/core/errors/failure_message.dart';
import 'package:cars/core/usecases/use_case.dart';
import 'package:cars/features/search/domain/entities/search_entity.dart';
import 'package:cars/features/search/domain/repos/search_repo.dart';
import 'package:dartz/dartz.dart';

class GetBrandsUseCase extends NoParameterUseCase<List<SearchFilterEntity>> {
  final SearchRepo _searchRepo;

  GetBrandsUseCase({
    required SearchRepo searchRepo,
  }) : _searchRepo = searchRepo;

  @override
  Future<Either<FailureServ, List<SearchFilterEntity>>> call() async {
    return await _searchRepo.getBrands();
  }
}
