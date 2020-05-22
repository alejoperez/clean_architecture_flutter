import '../../../core.dart';

import 'user_data_source_contracts.dart';
import '../../dto_model/request/login_request.dart';
import '../../dto_model/response/login_response.dart';

class UserRepository implements IUserRepository {
  final _localDataSource = locator<IUserLocalDataSource>();
  final _remoteDataSource = locator<IUserRemoteDataSource>();

  @override
  Future<String> getAuthToken() => _localDataSource.getAuthToken();

  @override
  Future<LoginResponse> login(LoginRequest request) => _remoteDataSource.login(request);
}
