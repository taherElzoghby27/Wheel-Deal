import 'package:cars/core/errors/failure_message.dart';
import 'package:cars/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<FailureServ, String>> signUp({required UserEntity userEntity});

  Future<Either<FailureServ, String>> login({required UserEntity userEntity});

  Future<Either<FailureServ, String>> resetPassword({
    required UserEntity userEntity,
  });

  Future<Either<FailureServ, String>> verifyEmail({
    required UserEntity userEntity,
  });
}
