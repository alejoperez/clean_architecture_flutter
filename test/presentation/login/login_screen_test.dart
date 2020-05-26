import 'package:clean/domain/model/login_result.dart';
import 'package:clean/domain/use_cases/login/login_use_case.dart';
import 'package:clean/presentation/base/view/app_button.dart';
import 'package:clean/presentation/base/view/app_progress_indicator.dart';
import 'package:clean/presentation/base/view_model/base_view_model.dart';
import 'package:clean/presentation/login/login_screen.dart';
import 'package:clean/presentation/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

class MockLoginUseCase extends Mock implements ILoginUseCase {}

class SpyLoginButton extends LoginButton implements Mock {
  @override
  String textButton(BuildContext ctx) => "textButton";
}

void main() {
  Provider.debugCheckInvalidValueType = null;

  final mockUseCase = MockLoginUseCase();
  GetIt.I.registerLazySingleton<ILoginUseCase>(() => mockUseCase);

  testWidgets('Login Screen - None', (WidgetTester tester) async {
    var loginViewModel = LoginViewModel();
    loginViewModel.setState(ViewState.None);
    await tester.pumpWidget(MaterialApp(
      home: Provider<LoginViewModel>(
        create: (_) => loginViewModel,
        child: SpyLoginButton(),
      ),
    ));

    final Finder appButton = find.byType(AppButton);
    expect(appButton, findsOneWidget);
  });

  testWidgets('Login Screen - Waiting', (WidgetTester tester) async {
    var loginViewModel = LoginViewModel();
    loginViewModel.setState(ViewState.Waiting);
    await tester.pumpWidget(MaterialApp(
      home: Provider<LoginViewModel>(
        create: (_) => loginViewModel,
        child: SpyLoginButton(),
      ),
    ));

    final Finder progress = find.byType(AppProgressIndicator);
    expect(progress, findsOneWidget);
  });

  testWidgets('Login Screen - Success/Failure', (WidgetTester tester) async {
    var loginViewModel = LoginViewModel();
    loginViewModel.setState(ViewState.Done);
    loginViewModel.loginEvent =
        SuccessEvent(LoginResult(userId: "userId", token: "token", error: ""));
    await tester.pumpWidget(MaterialApp(
      home: Provider<LoginViewModel>(
        create: (_) => loginViewModel,
        child: SpyLoginButton(),
      ),
    ));

    final Finder textResult = find.byType(Text);
    expect(textResult, findsOneWidget);
  });
}
