import 'package:clean/domain/model/login_result.dart';
import 'package:clean/domain/use_cases/login/login_use_case.dart';
import 'package:clean/presentation/base/view_model/base_view_model.dart';
import 'package:clean/presentation/login/login_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

class MockLoginUseCase extends Mock implements ILoginUseCase {}

void main() {

  var mockLoginUseCase = MockLoginUseCase();
  GetIt.instance.registerLazySingleton<ILoginUseCase>(() => mockLoginUseCase);

  group('LoginViewModel', () {
    test('loginSuccess', () async {
      when(mockLoginUseCase.execute(any, any)).thenAnswer((realInvocation) =>
          Future.value(LoginResult(userId: "userId",token: "token", error: ""))
      );

      final loginViewModel = LoginViewModel();
      await loginViewModel.login("email", "password");

      expect(loginViewModel.loginEvent, SuccessEvent(LoginResult(
        userId: "userId",
        token: "token",
        error: ""
      )));

    });

    test('loginFailure', () async {
      when(mockLoginUseCase.execute(any, any)).thenAnswer((realInvocation) =>
          Future.value(LoginResult(userId: "",token: "", error: "error"))
      );

      final loginViewModel = LoginViewModel();
      await loginViewModel.login("email", "password");

      expect(loginViewModel.loginEvent, FailureEvent("error"));

    });
  });
}