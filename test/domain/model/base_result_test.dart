import 'package:clean/domain/model/base_result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BaseResult', () {
    test('Non-null values', () {
      expect(BaseResult(error:"error"), BaseResult(error:"error"));
    });

    test('null values', () {
      expect(() => BaseResult(error:null), throwsAssertionError);
    });

  });
}