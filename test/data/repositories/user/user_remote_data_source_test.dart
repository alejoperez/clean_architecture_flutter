import 'package:clean/data/repositories/user/user_remote_data_source.dart';
import 'package:clean/data/webservices/api/user_api.dart';
import 'package:clean/data/webservices/dto/request/login_request_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

class MockUserApi extends Mock implements UserApi {}

void main() {

  var mockUserApi = MockUserApi();
  GetIt.instance.registerLazySingleton<UserApi>(() => mockUserApi);

  group('UserRemoteDataSource', () {
    test('User Login', () async {
      var request = LoginRequest(email: "email@email.com", password: "password");

      final userRemoteDataSource = UserRemoteDataSource();
      userRemoteDataSource.login(request);

      verify(mockUserApi.login(request)).called(1);

    });
  });
}