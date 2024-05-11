import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/errors/failure_message.dart';
import 'package:cars/features/auth/data/data_source/remote_data_source.dart';
import 'package:cars/features/auth/data/models/user_model.dart';
import 'package:cars/features/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRepoImpl extends AuthRepo {
  final RemoteDataSource _remoteDataSource;

  AuthRepoImpl({required RemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<FailureServ, UserModel>> login({
    required UserModel userEntity,
  }) async {
    try {
      UserModel result = await _remoteDataSource.login(
        userEntity: userEntity,
      );
      return Right(result);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(
        ServerFailure(message: StringsEn.errorMessage),
      );
    }
  }

  @override
  Future<Either<FailureServ, UserModel>> resetPassword({
    required UserModel userEntity,
  }) async {
    try {
      UserModel result = await _remoteDataSource.resetPassword(
        userEntity: userEntity,
      );
      return Right(result);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(
        ServerFailure(message: StringsEn.errorMessage),
      );
    }
  }

  @override
  Future<Either<FailureServ, UserModel>> signUp({
    required UserModel userEntity,
  }) async {
    try {
      UserModel result = await _remoteDataSource.signUp(userEntity: userEntity);
      return Right(result);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(
        ServerFailure(message: StringsEn.errorMessage),
      );
    }
  }

  @override
  Future<Either<FailureServ, UserModel>> verifyEmail({
    required UserModel userEntity,
  }) async {
    try {
      UserModel result = await _remoteDataSource.verifyEmail(
        userEntity: userEntity,
      );
      return Right(result);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(
        ServerFailure(message: StringsEn.errorMessage),
      );
    }
  }
}
