import 'package:cars/core/helper/strings.dart';
import 'package:cars/core/networking/failure_message.dart';
import 'package:cars/core/helper/flutter_secure_storage.dart';
import 'package:cars/features/profile/data/data_source/remote_data_source.dart';
import 'package:cars/features/profile/domain/entities/user_profile_entity.dart';
import 'package:cars/features/profile/domain/entities/user_verification_entity.dart';
import 'package:cars/features/profile/domain/repos/profile_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ProfileRemoteDataSource _profileRemoteDataSource;

  ProfileRepoImpl({required ProfileRemoteDataSource profileRemoteDataSource})
      : _profileRemoteDataSource = profileRemoteDataSource;

  @override
  Future<Either<FailureServ, UserProfileEntity>> getProfile() async {
    try {
      final UserProfileEntity userProfile =
          await _profileRemoteDataSource.getProfile();
      return Right(userProfile);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(message: StringsEn.errorMessage));
    }
  }

  @override
  Future<Either<FailureServ, String>> userVerification({
    required UserVerificationEntity userVerificationEntity,
  }) async {
    try {
      final String userVerification =
          await _profileRemoteDataSource.userVerification(
        userVerificationEntity: userVerificationEntity,
      );
      return Right(userVerification);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(message: StringsEn.errorMessage));
    }
  }

  @override
  Future<Either<FailureServ, String>> logout() async {
    try {
      await FlutterSecureStorageEncrypted.deleteAll();
      return const Right('Logout Successfully');
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(message: StringsEn.errorMessage));
    }
  }
}
