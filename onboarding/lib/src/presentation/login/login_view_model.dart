import '../../use_cases/login/login_use_case.dart';
import 'package:core/core.dart';
import 'package:flutter/foundation.dart';

enum ViewState {Idle, Loading, Success, Failure}

class LoginViewModel with ChangeNotifier {
  ViewState _viewState = ViewState.Idle;

  ViewState get viewState => _viewState;

  void setState(ViewState state) {
    _viewState = state;
    notifyListeners();
  }

  final _loginUseCase = locator<ILoginUseCase>();

  void login(String email, String password) async {
    setState(ViewState.Loading);
    final response = await _loginUseCase.execute(email, password);
    setState(ViewState.Success);
  }

}