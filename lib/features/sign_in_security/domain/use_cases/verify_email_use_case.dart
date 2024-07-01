import 'package:cars/core/networking/failure_message.dart';
import 'package:cars/core/helper/use_case.dart';
import 'package:cars/features/sign_in_security/domain/repos/sign_in_and_security_repo.dart';
import 'package:dartz/dartz.dart';

class VerifyEmailUseCase extends BaseUseCase<String, String> {
  final SignInAndSecurityRepo _signInAndSecurityRepo;

  VerifyEmailUseCase({required SignInAndSecurityRepo signInAndSecurityRepo})
      : _signInAndSecurityRepo = signInAndSecurityRepo;

  @override
  Future<Either<FailureServ, String>> call(
    String parameter,
  ) async {
    return await _signInAndSecurityRepo.verifyEmail(
      email: parameter,
    );
  }
}
