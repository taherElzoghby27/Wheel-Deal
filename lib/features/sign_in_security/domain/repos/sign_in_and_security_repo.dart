import 'package:cars/core/errors/failure_message.dart';
import 'package:dartz/dartz.dart';

import '../entities/sign_in_security_entity.dart';

abstract class SignInAndSecurityRepo {
  Future<Either<FailureServ, SignInSecurityEntity>> verifyEmail({
    required String email,
  });

  Future<Either<FailureServ, SignInSecurityEntity>> checkCodeInput({
    required SignInSecurityEntity model,
  });

  Future<Either<FailureServ, SignInSecurityEntity>> updateEmail({
    required SignInSecurityEntity model,
  });

  Future<Either<FailureServ, SignInSecurityEntity>> updatePassword({
    required SignInSecurityEntity model,
  });
}
