import 'package:clean/domain/model/login_result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BaseResult', () {
    test('Non-null values', () {
      expect(LoginResult(token: "token",userId: "userId",error:"error"), LoginResult(token: "token",userId: "userId",error:"error"));
    });

    test('null values', () {
      expect(() => LoginResult(token: null,userId: null,error:null), throwsAssertionError);
    });

  });
}