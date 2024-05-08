import 'package:cars/features/auth/data/models/user_model.dart';

abstract class RemoteDataSource {
  Future<UserModel> signUp({required UserModel userEntity});

  Future<UserModel> login({required UserModel userEntity});

  Future<UserModel> resetPassword({required UserModel userEntity});

  Future<UserModel> verifyEmail({required UserModel userEntity});
}
class RemoteDataSourceImpl extends RemoteDataSource{
  @override
  Future<UserModel> login({required UserModel userEntity}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<UserModel> resetPassword({required UserModel userEntity}) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signUp({required UserModel userEntity}) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  Future<UserModel> verifyEmail({required UserModel userEntity}) {
    // TODO: implement verifyEmail
    throw UnimplementedError();
  }
}