import 'package:cars/core/networking/failure_message.dart';
import 'package:cars/core/helper/use_case.dart';
import 'package:cars/features/search/domain/repos/search_repo.dart';
import 'package:dartz/dartz.dart';

class DeleteRecentSearchUseCase extends BaseUseCase<void, String> {
  final SearchRepo _searchRepo;

  DeleteRecentSearchUseCase({
    required SearchRepo searchRepo,
  }) : _searchRepo = searchRepo;

  @override
  Future<Either<FailureServ, void>> call(parameter) async {
    return await _searchRepo.deleteRecentSearch(searchQuery: parameter);
  }
}
