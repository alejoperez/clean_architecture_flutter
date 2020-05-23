import 'package:clean/dependency_injection.dart';

import 'user_data_source_contracts.dart';
import '../../webservices/dto/response/login_response_dto.dart';
import '../../webservices/dto/request/login_request_dto.dart';
import '../../webservices/api/user_api.dart';

class UserRemoteDataSource implements IUserRemoteDataSource {
  final _userApi = locator<UserApi>();

  @override
  Future<LoginResponseDTO> login(LoginRequest request) => _userApi.login(request);
}
