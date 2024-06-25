import 'package:cars/core/errors/failure_message.dart';
import 'package:cars/core/usecases/use_case.dart';
import 'package:cars/features/profile/domain/entities/user_verification_entity.dart';
import 'package:cars/features/profile/domain/repos/profile_repo.dart';
import 'package:dartz/dartz.dart';

class UserVerificationUseCase
    extends BaseUseCase<String, UserVerificationEntity> {
  final ProfileRepo _profileRepo;

  UserVerificationUseCase({required ProfileRepo profileRepo})
      : _profileRepo = profileRepo;

  @override
  Future<Either<FailureServ, String>> call(
    UserVerificationEntity parameter,
  ) async {
    return await _profileRepo.userVerification(
      userVerificationEntity: parameter,
    );
  }
}
