import 'package:clean/domain/model/login_result.dart';
import 'package:clean/domain/use_cases/login/login_use_case.dart';
import 'package:clean/presentation/base/app/dependency_injection.dart';
import 'package:clean/presentation/base/view_model/base_view_model.dart';
import 'package:flutter/foundation.dart';

class LoginViewModel extends BaseViewModel {
  @visibleForTesting Event loginEvent;

  Event get getLoginEvent => this.loginEvent;

  final _loginUseCase = locator<ILoginUseCase>();

  Future<void> login(String email, String password) async {
    setState(ViewState.Waiting);
    final LoginResult response = await _loginUseCase.execute(email, password);
    setState(ViewState.Done);

    if (response.error.isEmpty) {
      loginEvent = SuccessEvent(response);
    } else {
      loginEvent = FailureEvent(response.error);
    }
  }
}
