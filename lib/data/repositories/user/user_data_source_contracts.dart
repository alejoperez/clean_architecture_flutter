
import 'package:clean/domain/model/login_result.dart';

import '../../webservices/dto/request/login_request_dto.dart';
import '../../webservices/dto/response/login_response_dto.dart';

abstract class IUserRepository {
  Future<LoginResult> login(LoginRequest request);
  Future<String> getAuthToken();
}
abstract class IUserLocalDataSource {
  Future<String> getAuthToken();
  void saveAuthToken(String token);
}
abstract class IUserRemoteDataSource {
  Future<LoginResponseDTO> login(LoginRequest request);
}