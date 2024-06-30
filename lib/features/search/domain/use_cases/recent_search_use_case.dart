import 'package:cars/core/networking/failure_message.dart';
import 'package:cars/core/helper/use_case.dart';
import 'package:cars/features/search/data/models/recent_search_model.dart';
import 'package:cars/features/search/domain/repos/search_repo.dart';
import 'package:dartz/dartz.dart';

class GetRecentSearchUseCase
    extends NoParameterUseCase<List<RecentSearchModel>> {
  final SearchRepo _searchRepo;

  GetRecentSearchUseCase({
    required SearchRepo searchRepo,
  }) : _searchRepo = searchRepo;

  @override
  Future<Either<FailureServ, List<RecentSearchModel>>> call() async {
    return await _searchRepo.recentSearch();
  }
}
