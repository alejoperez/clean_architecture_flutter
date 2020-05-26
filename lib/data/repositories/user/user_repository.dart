
import 'package:clean/data/repositories/user/user_data_source_contracts.dart';
import 'package:clean/data/webservices/dto/request/login_request_dto.dart';
import 'package:clean/data/webservices/dto/response/login_response_dto.dart';
import 'package:clean/domain/model/login_result.dart';
import 'package:clean/presentation/base/app/dependency_injection.dart';

class UserRepository implements IUserRepository {
  final _localDataSource = locator<IUserLocalDataSource>();
  final _remoteDataSource = locator<IUserRemoteDataSource>();

  @override
  Future<String> getAuthToken() => _localDataSource.getAuthToken();

  @override
  Future<LoginResult> login(LoginRequest request) async {
    final LoginResponseDTO response = await _remoteDataSource.login(request);
    _localDataSource.saveAuthToken(response.token);
    return response.toDomain();
  }
}
