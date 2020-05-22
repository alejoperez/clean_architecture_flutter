import 'package:core/core.dart';

abstract class ILoginUseCase {
  Future<LoginResponse> execute(String email, String password);
}

class LoginUseCase implements ILoginUseCase {

  final _userRepository = locator<IUserRepository>();

  @override
  Future<LoginResponse> execute(String email, String password) {
    return _userRepository.login(
        LoginRequest(
            email:email,
            password: password
        )
    );
  }
}