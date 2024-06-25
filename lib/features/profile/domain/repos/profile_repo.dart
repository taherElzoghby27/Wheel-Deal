import 'package:cars/core/errors/failure_message.dart';
import 'package:cars/features/profile/domain/entities/user_profile_entity.dart';
import 'package:cars/features/profile/domain/entities/user_verification_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepo {
  Future<Either<FailureServ, UserProfileEntity>> getProfile();

  Future<Either<FailureServ, String>> userVerification({
    required UserVerificationEntity userVerificationEntity,
  });
}
