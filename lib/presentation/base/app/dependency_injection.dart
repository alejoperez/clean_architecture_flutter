import 'package:get_it/get_it.dart';

import 'package:clean/data/repositories/user/user_data_source_contracts.dart';
import 'package:clean/data/repositories/user/user_local_data_source.dart';
import 'package:clean/data/repositories/user/user_remote_data_source.dart';
import 'package:clean/data/repositories/user/user_repository.dart';
import 'package:clean/data/webservices/api/user_api.dart';
import 'package:clean/domain/use_cases/login/login_use_case.dart';

GetIt locator = GetIt.instance;

class DependencyInjection {
  static void init() {
    _initWebServices();
    _initRepositories();
    _initUseCases();
  }
  static void _initWebServices() {
    locator.registerLazySingleton(() => UserApi());
  }

  static void _initRepositories() {
    locator.registerLazySingleton<IUserRepository>(() => UserRepository());
    locator.registerLazySingleton<IUserLocalDataSource>(() => UserLocalDataSource());
    locator.registerLazySingleton<IUserRemoteDataSource>(() => UserRemoteDataSource());
  }

  static void _initUseCases() {
    locator.registerLazySingleton<ILoginUseCase>(() => LoginUseCase());
  }

}



