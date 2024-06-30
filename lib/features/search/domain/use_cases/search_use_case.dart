import 'package:cars/core/networking/failure_message.dart';
import 'package:cars/core/helper/use_case.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';
import 'package:cars/features/search/domain/repos/search_repo.dart';
import 'package:dartz/dartz.dart';

class SearchUseCase extends BaseUseCase<List<CarEntity>, String> {
  final SearchRepo _searchRepo;

  SearchUseCase({
    required SearchRepo searchRepo,
  }) : _searchRepo = searchRepo;

  @override
  Future<Either<FailureServ, List<CarEntity>>> call(String parameter) async {
    return await _searchRepo.search(searchWord: parameter);
  }
}
