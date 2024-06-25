import 'package:cars/core/errors/failure_message.dart';
import 'package:cars/core/usecases/use_case.dart';
import 'package:cars/features/sign_in_security/domain/entities/sign_in_security_entity.dart';
import 'package:cars/features/sign_in_security/domain/repos/sign_in_and_security_repo.dart';
import 'package:dartz/dartz.dart';

class VerifyEmailUseCase extends BaseUseCase<SignInSecurityEntity, String> {
  final SignInAndSecurityRepo _signInAndSecurityRepo;

  VerifyEmailUseCase({required SignInAndSecurityRepo signInAndSecurityRepo})
      : _signInAndSecurityRepo = signInAndSecurityRepo;

  @override
  Future<Either<FailureServ, SignInSecurityEntity>> call(
    String parameter,
  ) async {
    return await _signInAndSecurityRepo.verifyEmail(
      email: parameter,
    );
  }
}
