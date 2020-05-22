// Presentation
export 'src/presentation/login/login_screen.dart';
export 'src/presentation/login/login_view_model.dart';

//Dependency Injection
import 'package:core/core.dart';
import 'src/use_cases/login/login_use_case.dart';

void initOnboardingDependencyInjection() {
  locator.registerLazySingleton<ILoginUseCase>(() => LoginUseCase());
}