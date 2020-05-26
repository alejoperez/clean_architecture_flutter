import 'package:clean/data/webservices/dto/request/login_request_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LoginRequest', () {
    test('To Json map', () {
      final request = LoginRequest(
        email: "email@email.com",
        password: "12345"
      );
      final actual = request.toJson();
      final expected = {
        "email": "email@email.com",
        "password": "12345"
      };
      expect(actual, expected);
    });
  });
}