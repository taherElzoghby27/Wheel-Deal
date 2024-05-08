import 'package:cars/core/errors/failure_message.dart';
import 'package:cars/core/usecases/use_case.dart';
import 'package:cars/features/auth/domain/entities/user_entity.dart';
import 'package:cars/features/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';

class ResetPasswordUseCase extends BaseUseCase<String, UserEntity> {
  final AuthRepo _authRepo;

  ResetPasswordUseCase({required AuthRepo authRepo}) : _authRepo = authRepo;

  @override
  Future<Either<FailureServ, String>> call(UserEntity parameter) async {
    return await _authRepo.resetPassword(userEntity: parameter);
  }
}
