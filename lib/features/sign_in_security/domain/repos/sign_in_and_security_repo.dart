import 'package:cars/core/networking/failure_message.dart';
import 'package:dartz/dartz.dart';

import '../entities/sign_in_security_entity.dart';

abstract class SignInAndSecurityRepo {
  Future<Either<FailureServ, String>> verifyEmail({
    required String email,
  });

  Future<Either<FailureServ, String>> checkCodeInput({
    required SignInSecurityEntity model,
  });

  Future<Either<FailureServ, String>> updateEmail({
    required SignInSecurityEntity model,
  });

  Future<Either<FailureServ, String>> updatePassword({
    required SignInSecurityEntity model,
  });
}
