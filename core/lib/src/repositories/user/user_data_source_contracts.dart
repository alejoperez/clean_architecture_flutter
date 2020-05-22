import '../../dto_model/request/login_request.dart';
import '../../dto_model/response/login_response.dart';

abstract class IUserRepository {
  Future<LoginResponse> login(LoginRequest request);
  Future<String> getAuthToken();
}
abstract class IUserLocalDataSource {
  Future<String> getAuthToken();
}
abstract class IUserRemoteDataSource {
  Future<LoginResponse> login(LoginRequest request);
}