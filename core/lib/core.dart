//Repositories
export 'src/repositories/user/user_repository.dart';
export 'src/repositories/user/user_local_data_source.dart';
export 'src/repositories/user/user_remote_data_source.dart';
export 'src/repositories/user/user_data_source_contracts.dart';

// Domain Model
export 'src/domain_model/user.dart';

// DTO Requests
export 'src/dto_model/request/login_request.dart';

// DTO Responses
export 'src/dto_model/response/login_response.dart';

// Dependency Injection
import 'package:get_it/get_it.dart';
import './src/repositories/user/user_data_source_contracts.dart';
import './src/repositories/user/user_repository.dart';
import './src/repositories/user/user_local_data_source.dart';
import './src/repositories/user/user_remote_data_source.dart';

GetIt locator = GetIt.instance;

void initCoreDependencyInjection() {
  locator.registerLazySingleton<IUserRepository>(() => UserRepository());
  locator.registerLazySingleton<IUserLocalDataSource>(() => UserLocalDataSource());
  locator.registerLazySingleton<IUserRemoteDataSource>(() => UserRemoteDataSource());
}