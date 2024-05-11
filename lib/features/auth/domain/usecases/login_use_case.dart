import 'package:cars/core/errors/failure_message.dart';
import 'package:cars/core/usecases/use_case.dart';
import 'package:cars/features/auth/data/models/user_model.dart';
import 'package:cars/features/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase extends BaseUseCase<UserModel, UserModel> {
  final AuthRepo _authRepo;

  LoginUseCase({
    required AuthRepo authRepo,
  }) : _authRepo = authRepo;

  @override
  Future<Either<FailureServ, UserModel>> call(UserModel parameter) async {
    return await _authRepo.login(userEntity: parameter);
  }
}
