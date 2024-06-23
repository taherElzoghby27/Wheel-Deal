import 'package:cars/core/errors/failure_message.dart';
import 'package:cars/core/usecases/use_case.dart';
import 'package:cars/features/profile/domain/entities/user_profile_entity.dart';
import 'package:cars/features/profile/domain/repos/profile_repo.dart';
import 'package:dartz/dartz.dart';

class GetProfileUseCase extends NoParameterUseCase<UserProfileEntity> {
  final ProfileRepo _profileRepo;

  GetProfileUseCase({required ProfileRepo profileRepo})
      : _profileRepo = profileRepo;

  @override
  Future<Either<FailureServ, UserProfileEntity>> call() async {
    return await _profileRepo.getProfile();
  }
}
