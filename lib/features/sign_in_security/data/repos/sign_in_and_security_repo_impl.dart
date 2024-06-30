import 'package:cars/core/networking/failure_message.dart';
import 'package:cars/features/sign_in_security/data/data_source/sign_in_security_remote.dart';
import 'package:cars/features/sign_in_security/domain/entities/sign_in_security_entity.dart';
import 'package:cars/features/sign_in_security/domain/repos/sign_in_and_security_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/helper/strings.dart';

class SignInAndSecurityRepoImpl extends SignInAndSecurityRepo {
  final SignInSecurityRemote _signInSecurityRemote;

  SignInAndSecurityRepoImpl({
    required SignInSecurityRemote signInSecurityRemote,
  }) : _signInSecurityRemote = signInSecurityRemote;

  @override
  Future<Either<FailureServ, String>> checkCodeInput({
    required SignInSecurityEntity model,
  }) async {
    try {
      String result = await _signInSecurityRemote.checkCodeInput(
        model: model,
      );
      return Right(result);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(message: StringsEn.errorMessage));
    }
  }

  @override
  Future<Either<FailureServ, String>> updateEmail({
    required SignInSecurityEntity model,
  }) async {
    try {
      String result = await _signInSecurityRemote.updateEmail(
        model: model,
      );
      return Right(result);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(message: StringsEn.errorMessage));
    }
  }

  @override
  Future<Either<FailureServ, String>> updatePassword({
    required SignInSecurityEntity model,
  }) async {
    try {
      String result = await _signInSecurityRemote.updatePassword(
        model: model,
      );
      return Right(result);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(message: StringsEn.errorMessage));
    }
  }

  @override
  Future<Either<FailureServ, String>> verifyEmail({
    required String email,
  }) async {
    try {
      String result = await _signInSecurityRemote.verifyEmail(
        email: email,
      );
      return Right(result);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(message: StringsEn.errorMessage));
    }
  }
}
