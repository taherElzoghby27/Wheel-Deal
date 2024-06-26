import 'package:cars/core/errors/failure_message.dart';
import 'package:cars/core/usecases/use_case.dart';
import 'package:cars/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class UserInfoUseCase extends BaseUseCase<String, String> {
  final HomeRepo _homeRepo;

  UserInfoUseCase({required HomeRepo homeRepo}) : _homeRepo = homeRepo;

  @override
  Future<Either<FailureServ, String>> call(
    String parameter,
  ) async {
    return await _homeRepo.userInfo(income: parameter);
  }
}
