import 'package:cars/core/errors/failure_message.dart';
import 'package:cars/core/usecases/use_case.dart';
import 'package:cars/features/profile/domain/repos/profile_repo.dart';
import 'package:dartz/dartz.dart';

class LogoutUseCase extends NoParameterUseCase<String> {
  final ProfileRepo _profileRepo;

  LogoutUseCase({required ProfileRepo profileRepo})
      : _profileRepo = profileRepo;

  @override
  Future<Either<FailureServ, String>> call() async {
    return await _profileRepo.logout();
  }
}
