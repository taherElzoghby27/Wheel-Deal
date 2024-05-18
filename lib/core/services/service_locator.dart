import 'package:cars/core/services/api_service.dart';
import 'package:cars/core/services/hive_db/hive_db_brands_home.dart';
import 'package:cars/core/services/hive_db/hive_db_cars_home.dart';
import 'package:cars/features/auth/data/data_source/remote_data_source.dart';
import 'package:cars/features/auth/data/repos/auth_repo_impl.dart';
import 'package:cars/features/auth/domain/usecases/checking_for_reset_password_use_case.dart';
import 'package:cars/features/auth/domain/usecases/login_use_case.dart';
import 'package:cars/features/auth/domain/usecases/reset_password_use_case.dart';
import 'package:cars/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:cars/features/home/data/data_sources/local_data_source.dart';
import 'package:cars/features/home/data/data_sources/remote_data_source.dart';
import 'package:cars/features/home/data/repos/home_repo_impl.dart';
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
  getIt.registerSingleton<ResetPasswordUseCase>(
    ResetPasswordUseCase(
      authRepo: getIt.get<AuthRepoImpl>(),
    ),
  );
  getIt.registerSingleton<VerifyEmailUseCase>(
    VerifyEmailUseCase(
      authRepo: getIt.get<AuthRepoImpl>(),
    ),
  );
  getIt.registerSingleton<HomeRemoteDataSourceImpl>(
    HomeRemoteDataSourceImpl(
      apiService: getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<HiveDbBrandsHome>(
    HiveDbBrandsHome(),
  );
  getIt.registerSingleton<HiveDbCarsHome>(
    HiveDbCarsHome(),
  );
  getIt.registerSingleton<HomeLocalDataSourceImpl>(
    HomeLocalDataSourceImpl(
      hiveDbBrandsHome: getIt.get<HiveDbBrandsHome>(),
      hiveDbCarsHome: getIt.get<HiveDbCarsHome>(),
    ),
  );
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeRemoteDataSource: getIt.get<HomeRemoteDataSourceImpl>(),
      homeLocalDataSource: getIt.get<HomeLocalDataSourceImpl>(),
    ),
  );
}
