import 'package:clean/data/repositories/user/user_data_source_contracts.dart';
import 'package:clean/domain/use_cases/login/login_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

class MockUserRepository extends Mock implements IUserRepository {}

void main() {

  var mockUserRepository = MockUserRepository();
  GetIt.instance.registerLazySingleton<IUserRepository>(() => mockUserRepository);

  group('LoginUseCase', () {
    test('User Login', () async {

      final loginUseCase = LoginUseCase();
      await loginUseCase.execute("email", "password");

      verify(mockUserRepository.login(any)).called(1);

    });

  });
}