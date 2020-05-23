import 'package:clean/dependency_injection.dart';
import 'package:clean/domain/use_cases/login/login_use_case.dart';
import 'package:clean/presentation/base/view_model/base_view_model.dart';

class LoginViewModel extends BaseViewModel {
  Event _loginEvent;

  Event get loginEvent => _loginEvent;

  final _loginUseCase = locator<ILoginUseCase>();

  void login(String email, String password) async {
    _loginEvent = await executeAsync(_loginUseCase.execute("email", "password"));
  }
}
