import 'user_data_source_contracts.dart';
import '../../dto_model/response/login_response.dart';
import '../../dto_model/request/login_request.dart';

class UserRemoteDataSource implements IUserRemoteDataSource {
  @override
  Future<LoginResponse> login(LoginRequest request) async {
    return Future.delayed(const Duration(seconds: 3), () => LoginResponse("userId","token"));
  }

}