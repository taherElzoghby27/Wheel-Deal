import 'package:cars/core/services/api_service.dart';
import 'package:cars/features/auth/data/data_source/remote_data_source.dart';
import 'package:cars/features/auth/data/repos/auth_repo_impl.dart';
import 'package:cars/features/auth/domain/usecases/login_use_case.dart';
import 'package:cars/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService());
  getIt.registerSingleton<RemoteDataSourceImpl>(
    RemoteDataSourceImpl(
      apiService: getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(
      remoteDataSource: getIt.get<RemoteDataSourceImpl>(),
    ),
  );
  getIt.registerSingleton<SignUpUseCase>(
    SignUpUseCase(
      authRepo: getIt.get<AuthRepoImpl>(),
    ),
  );
  getIt.registerSingleton<LoginUseCase>(
    LoginUseCase(
      authRepo: getIt.get<AuthRepoImpl>(),
    ),
  );
}
