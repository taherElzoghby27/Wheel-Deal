import 'package:cars/core/consts/api.dart';
import 'package:cars/core/services/api_service.dart';
import 'package:cars/features/auth/data/models/user_model.dart';

abstract class RemoteDataSource {
  Future<UserModel> signUp({required UserModel userEntity});

  Future<UserModel> login({required UserModel userEntity});

  Future<UserModel> resetPassword({required UserModel userEntity});

  Future<UserModel> verifyEmail({required UserModel userEntity});
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final ApiService _apiService;

  RemoteDataSourceImpl({required ApiService apiService})
      : _apiService = apiService;

  @override
  Future<UserModel> login({required UserModel userEntity}) async {
    Map<String, dynamic> result = await _apiService.post(
      endPoint: ApiConsts.loginEndpoint,
      data: userEntity.toMapLogin(),
    );
    UserModel userModel = UserModel.fromMap(result);
    return userModel;
  }

  @override
  Future<UserModel> signUp({required UserModel userEntity}) async {
    Map<String, dynamic> result = await _apiService.post(
      endPoint: ApiConsts.loginEndpoint,
      data: userEntity.toMapSignUp(),
    );
    UserModel userModel = UserModel.fromMap(result);
    return userModel;
  }

  @override
  Future<UserModel> verifyEmail({required UserModel userEntity}) async {
    // TODO: implement verifyEmail
    throw UnimplementedError();
  }

  @override
  Future<UserModel> resetPassword({required UserModel userEntity}) async {
    // TODO: implement verifyEmail
    throw UnimplementedError();
  }
}
