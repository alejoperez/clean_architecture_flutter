import 'package:clean/data/repositories/user/user_data_source_contracts.dart';
import 'package:clean/data/webservices/dto/request/login_request_dto.dart';
import 'package:clean/dependency_injection.dart';
import 'package:clean/domain/model/login_result.dart';

abstract class ILoginUseCase {
  Future<LoginResult> execute(String email, String password);
}

class LoginUseCase implements ILoginUseCase {

  final _userRepository = locator<IUserRepository>();

  @override
  Future<LoginResult> execute(String email, String password) {
    return _userRepository.login(
        LoginRequest(
            email:email,
            password: password
        )
    );
  }
}