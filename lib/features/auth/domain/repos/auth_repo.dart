import 'package:cars/core/errors/failure_message.dart';
import 'package:cars/features/auth/data/models/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<FailureServ, UserModel>> signUp({required UserModel userEntity});

  Future<Either<FailureServ, UserModel>> login({required UserModel userEntity});

  Future<Either<FailureServ, UserModel>> resetPassword({
    required UserModel userEntity,
  });

  Future<Either<FailureServ, UserModel>> verifyEmail({
    required UserModel userEntity,
  });
}
