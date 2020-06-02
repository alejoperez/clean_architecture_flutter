import 'package:clean/data/webservices/dto/response/login_response_dto.dart';
import 'package:clean/domain/model/login_result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LoginResponseDTO', () {
    test('From Json values', () {
      final actual = LoginResponseDTO.fromJson({
        "error": "error",
        "userId": "userId",
        "token": "token"
      });
      final expected = LoginResponseDTO(
          error: "error",
          userId: "userId",
          token: "token"
      );
      expect(actual, expected);
    });

    test('From empty Json', () {
      final actual = LoginResponseDTO.fromJson({});
      final expected = LoginResponseDTO(
          error: null,
          userId: null,
          token: null
      );
      expect(actual, expected);
    });

    test('To Domain values', () {
      final dto = LoginResponseDTO(
          error: "error",
          userId: "userId",
          token: "token"
      );
      final actual = dto.toDomain();
      final expected = LoginResult(
        error: "error",
        userId: "userId",
        token: "token"
      );

      expect(actual, expected);
    });

    test('To Domain null values', () {
      final dto = LoginResponseDTO(
          error: null,
          userId: null,
          token: "null"
      );
      final actual = dto.toDomain();
      final expected = LoginResult(
          error: "",
          userId: "",
          token: ""
      );

      expect(actual, expected);
    });

  });
}