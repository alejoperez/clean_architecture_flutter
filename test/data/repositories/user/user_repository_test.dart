import 'package:clean/data/repositories/user/user_data_source_contracts.dart';
import 'package:clean/data/repositories/user/user_repository.dart';
import 'package:clean/data/webservices/dto/request/login_request_dto.dart';
import 'package:clean/data/webservices/dto/response/login_response_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

class MockUserLocalDataSource extends Mock implements IUserLocalDataSource {}
class MockUserRemoteDataSource extends Mock implements IUserRemoteDataSource {}

void main() {

  var mockUserLocalDataSource = MockUserLocalDataSource();
  var mockUserRemoteDataSource = MockUserRemoteDataSource();
  GetIt.instance.registerLazySingleton<IUserLocalDataSource>(() => mockUserLocalDataSource);
  GetIt.instance.registerLazySingleton<IUserRemoteDataSource>(() => mockUserRemoteDataSource);

  group('UserRepository', () {
    test('User Login', () async {

      var request = LoginRequest(email: "email@email.com", password: "password");

      when(mockUserRemoteDataSource.login(request)).thenAnswer((realInvocation) => Future.value(LoginResponseDTO(
        token:"token",
        userId: "userId",
        error: "",
      )));

      final userRepository = UserRepository();
      await userRepository.login(request);

      verify(mockUserRemoteDataSource.login(request)).called(1);
      verify(mockUserLocalDataSource.saveAuthToken(any)).called(1);

    });

    test('Get Auth Token', () async {
      final userRepository = UserRepository();
      userRepository.getAuthToken();

      verify(mockUserLocalDataSource.getAuthToken()).called(1);

    });

  });
}